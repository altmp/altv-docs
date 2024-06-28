function PostCleanup([bool] $cleanMetadata=$false) {
    Remove-Item -Path "${env:TMP}/docfx.zip" -Force 2>&1 >$null
    Remove-Item -Path "${env:TMP}/docfx-plugins-typescriptreference.zip" -Force 2>&1 >$null
    Remove-Item -Path "${env:TMP}/docfx-plugins-extractsearchindex.zip" -Force 2>&1 >$null
    Remove-Item -Path "${env:TMP}/docfx-tmpls-discordfx.zip" -Force 2>&1 >$null
    if($cleanMetadata) {
        Remove-Item -Path "${env:TMP}/obj" -Recurse -Force 2>&1 >$null
        Remove-Item -Path "./_site/" -Recurse -Force 2>&1 >$null
        Remove-Item -Path "./api/**.yml" -Force 2>&1 >$null
        Remove-Item -Path "./altv-types/docs/_site/" -Recurse -Force 2>&1 >$null
        Remove-Item -Path "./altv-types/docs/obj" -Recurse -Force 2>&1 >$null
        Remove-Item -Path "./altv-types/docs/api/**.yml" -Force 2>&1 >$null
        Remove-Item -Path "./altv-types/docs/api/.manifest" -Force 2>&1 >$null
        Remove-Item -Path "./coreclr-module/docs/_site/" -Recurse -Force 2>&1 >$null
        Remove-Item -Path "./coreclr-module/docs/obj" -Recurse -Force 2>&1 >$null
        Remove-Item -Path "./coreclr-module/docs/api/**.yml" -Force 2>&1 >$null
        Remove-Item -Path "./coreclr-module/docs/api/.manifest" -Force 2>&1 >$null
    }
}
Export-ModuleMember -Function PostCleanup

function RunThroughMonoIfOnUnix([string] $prog, [Parameter(ValueFromRemainingArguments)][Array] $arguments) {
    if(-not [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::LINUX)) {
        & $prog $arguments
    } else {
        & "mono" $prog $arguments
    }
}
Export-ModuleMember -Function RunThroughMonoIfOnUnix

function GetAssemblyVersion([string] $file) {
    if(-not (Test-Path -Path $file)) { return "not found" }
    $ver=(Get-Item -Path $file | Select-Object -ExpandProperty VersionInfo).FileVersion.Split('.')
    if($ver.Length -lt 4) {
        $ver -Join '.'
    } else {
        ($ver | Select -SkipLast 1) -Join '.'
    }
}
Export-ModuleMember -Function GetAssemblyVersion

function GetVisualStudioVersion() {
    if(-not (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe")) { return "not found" }
    $instances=& "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -products * -latest -format json | ConvertFrom-Json
    if($instances.Length -gt 0) {
        $instances[0].installationVersion
    } else {
        "none"
    }
}
Export-ModuleMember -Function GetVisualStudioVersion

function GetNodePackageManager() {
    return ((Get-Command "yarn" -ea SilentlyContinue), (Get-Command "npm" -ea SilentlyContinue) -ne $null)[0]
}
Export-ModuleMember -Function GetNodePackageManager

function GetNodePackageVersion([string] $package) {
    $pkgCmd=GetNodePackageManager
    if(-not $pkgCmd) { return "not found" }
    if(-not $package) { return (& $pkgCmd.Name -v) }
    if($pkgCmd.Name -like "yarn") {
        yarn -s info $package version
    } else {
        npm view $package version
    }
}
Export-ModuleMember -Function GetNodePackageVersion

function RunNodePackage([string] $package) {
    $pkgCmd=GetNodePackageManager
    if(-not $pkgCmd) { return }
    if($pkgCmd.Name -like "yarn") {
        yarn run $package $args
    } else {
        npx $package $args
    }
}
Export-ModuleMember -Function RunNodePackage

function IsVisualStudioInstalled() {
    if(-not (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe")) { $false; return }
    $instances=& "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -products * -requires Microsoft.NetCore.Component.SDK -latest -format json | ConvertFrom-Json
    $instances.Length -gt 0
}
Export-ModuleMember -Function IsVisualStudioInstalled

function FetchAndDownloadRelease([string] $repo, [string] $path, [string] $archive, [string] $tag=$null) {
    $global:ProgressPreference='SilentlyContinue'
    if(-not $tag) {
        $tag=((Invoke-WebRequest -UseBasicParsing "https://api.github.com/repos/$repo/releases" | ConvertFrom-Json) | Where-Object { -not $_.prerelease } | Select-Object -First 1 -ExpandProperty "tag_name")
    }
    Invoke-WebRequest -UseBasicParsing "https://github.com/$repo/releases/download/$tag/$archive" -OutFile "$path/$archive"
    $global:ProgressPreference='Continue'
    return ([int]$? - 1)
}
Export-ModuleMember -Function FetchAndDownloadRelease

function ExtractArchive([string] $path, [string] $dest) {
    if(-not (Test-Path -Path $path)) { throw "Cannot find path $path because it does not exist." }
    $file=Get-Item -Path $path
    if(!$dest) {
        $dest=$file.FullName.Substring(0, $file.FullName.LastIndexOf('.'))
    }
    $global:ProgressPreference='SilentlyContinue'
    Expand-Archive -Path $file -DestinationPath $dest -Force
    $global:ProgressPreference='Continue'
    return ([int]$? - 1)
}
Export-ModuleMember -Function ExtractArchive

function Start-Task {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string] $caption,
        [Parameter(Mandatory=$false)]
        [ScriptBlock] $scriptBlock,
        [Parameter(Mandatory=$false)]
        [Array] $arguments,
        [Parameter(Mandatory=$false)]
        [ScriptBlock] $predicate={ $true }
    )
    process {
        if (-not $(Invoke-Command -ScriptBlock $predicate)) {
            return
        }
        Write-Host -NoNewline "$caption . . . "
        $action={ Exit-Task $(if($LastExitCode -ne 0x0) { $LastExitCode } else { 1 - [int]$? }) }
        $strm=Invoke-Command -ScriptBlock ([ScriptBlock]::Create("do{" + $scriptBlock.ToString() + "`n" + $action.ToString() + "}while(`$false);")) -ArgumentList $arguments -ErrorVariable err *>&1
        # $verb=$strm | ?{ $_ -is [System.Management.Automation.VerboseRecord] }
        # $err=$strm | ?{ $_ -is [System.Management.Automation.ErrorRecord] }
        # $info=$strm | ?{ $_ -is [System.Management.Automation.InformationRecord] } | ?{ $_.Tags -ne "ExitCode" }
        # $out=$strm | ?{ $_.GetType().FullName -notlike "System.Management.Automation.*Record" }
        $exitCode=$strm | ?{ $_.Tags -eq "ExitCode" } | %{ $_.MessageData } | Select -Last 1
        if($exitCode -eq 0x0) {
            Write-Host -NoNewline -ForegroundColor 'green' "done`n"
        } elseif($exitCode -eq -0x1) {
            Write-Host -NoNewline -ForegroundColor 'yellow' "skipped`n"
        } elseif($exitCode -gt 0x0) {
            Write-Host -NoNewline -ForegroundColor 'red' "failed"
            Write-Host -NoNewline -ForegroundColor 'red' " with code $($exitCode):`n$($err)"
            exit
        }
        Write-Host -NoNewline ($strm | ?{ $_.Tags -eq "Output" } | %{ $_.MessageData })
    }
}
Export-ModuleMember -Function Start-Task

function Exit-Task {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [int32] $exitCode
    )
    process {
        Write-Information -Tags "ExitCode" -MessageData $exitCode.ToString()
        break
    }
}
Export-ModuleMember -Function Exit-Task

$pipeline=([ScriptBlock]::Create({
    New-Item -ItemType "Directory" -Path "$tmpd" 2>&1 >$null

    if($cleanOnly) { exit }

    foreach($el in $requiredRepos.GetEnumerator()) {
        if (-not ($el.Value["strategy"].HasFlag($strategy))) {
            continue
        }
        Start-Task "Checkout $($el.Value["name"]) repository" {
            $el=$args[0]
            $cwd=$args[1]
            if(Test-Path $el.Key) {
                Set-Location -Path $el.Key
                git fetch --depth 1 "origin" $el.Value["ref"]
                if((git status -s -b) -like "*``[*behind *``]") {
                    git clean -d -x -f
                    git reset --hard "FETCH_HEAD"
                    Set-Location $cwd
                    Exit-Task (0x0)
                } else {
                    Set-Location $cwd
                    Exit-Task (-0x1)
                }
            }
            if (-not $el.Value["ref"]) {
                git clone $el.Value["repo"] --depth 1 --quiet
            } else {
                git clone $el.Value["repo"] --branch $el.Value["ref"] --depth 1 --quiet
            }
            if ($el.Value["submodules"] -ne $false) {
                Set-Location -Path $el.Key
                git submodule update --init
            }
        } @($el, $cwd)
    }

    foreach($el in $requiredPackages.GetEnumerator()) {
        if (-not ($el.Value["strategy"].HasFlag($strategy))) {
            continue
        }
        Start-Task "Downloading $($el.Value["name"]) package" {
            $el=$args[0]
            $tmpd=$args[1]
            if(Test-Path $el.Value["predicate"]) { Exit-Task (-0x1) }
            FetchAndDownloadRelease $el.Value["repo"] "$tmpd/" $el.Value["archive_name"] $el.Value["version"]
        } @($el, $tmpd)
        Start-Task "Extracting $($el.Value["name"]) package" {
            $el=$args[0]
            $tmpd=$args[1]
            if(Test-Path $el.Value["predicate"]) { Exit-Task (-0x1) }
            ExtractArchive "$tmpd/$($el.Value["archive_name"])" $el.Value["dest"]
        } @($el, $tmpd)
    }

    Start-Task "Tools version" {
        $cwd=$args[0]
        Set-Location $cwd
        $tools=[Ordered]@{
            "Node.js"=(node -v);
            "Yarn/npm"=GetNodePackageVersion;
            "Visual Studio"=GetVisualStudioVersion;
            "DocFx"=GetAssemblyVersion "./docfx/docfx.exe";
            "DocFx TypeScriptReference"=GetAssemblyVersion "./templates/docfx-plugins-typescriptreference/plugins/DocFx.*.dll";
            "DocFx AddImageModal"=GetAssemblyVersion "./templates/docfx-plugins-addimagemodal/plugins/DocFx.*.dll";
            "DocFx ExtractSearchIndex"=GetAssemblyVersion "./templates/docfx-plugins-extractsearchindex/plugins/DocFx.*.dll";
            "DocFx ExtractArticleAffix"=GetAssemblyVersion "./templates/docfx-plugins-extractarticleaffix/plugins/DocFx.*.dll";
            "TypeDoc"=GetNodePackageVersion "typedoc";
            "type2docfx"=GetNodePackageVersion "type2docfx";
        }
        Write-Information -Tags "Output" -MessageData ($tools | Format-Table | Out-String)
    } @($cwd)

    Start-Task "Generating JS project metadata" {
        $cwd=$args[0]
        Set-Location -Path "./altv-types/docs/"
        $pkgCmd=GetNodePackageManager
        if(-not $pkgCmd) { Exit-Task (0x1) }
        if(-not (Test-Path "../node_modules/")) { & $pkgCmd install }
        RunNodePackage "typedoc" --options "./typedoc.json"
        RunNodePackage "type2docfx" "./api/.manifest" "./api/" --basePath "." --sourceUrl "https://github.com/altmp/altv-types" --sourceBranch "master" --tocAlphabetOrderOnly
        Set-Location $cwd
    } @($cwd) { ($requiredTasks["generate-js"]["strategy"]).HasFlag($strategy) }
    Start-Task "Generating C# project metadata" {
        if(IsVisualStudioInstalled) {
            RunThroughMonoIfOnUnix "./docfx/docfx.exe" metadata "./coreclr-module/docs/docfx.json"
        } else {
            New-Item -Path "./coreclr-module/docs/api/toc.yml" -Value "# Autogenerated file to prevent missing file error`n[]`n" -Force
            Exit-Task (-0x1)
        }
    } { ($requiredTasks["generate-cs"]["strategy"]).HasFlag($strategy) }

    RunThroughMonoIfOnUnix "./docfx/docfx.exe" build "docfx.json" --intermediateFolder "$tmpd/obj/" --serve `-p $port
}))

Add-Type @'
[System.Flags()]
public enum StrategyType {
    Core = 1,
    JavaScript = 2,
    CSharp = 4,
    Cpp = 8,
    GTA = 16,
    All = 255,
}
'@

$requiredRepos=[Ordered]@{
    "./altv-types/"=@{
        "repo"="https://github.com/altmp/altv-types/";
        "name"="JS";
        "strategy"=([StrategyType]::Core + [StrategyType]::JavaScript);
        "submodules"=$false;
    };
    "./coreclr-module/"=@{
        "repo"="https://github.com/altmp/coreclr-module";
        "name"="C#";
        "strategy"=([StrategyType]::Core + [StrategyType]::CSharp);
        "submodules"=$false;
    };
    "./cpp-sdk/"=@{
        "repo"="https://github.com/altmp/cpp-sdk/";
        "ref"="docs";
        "name"="SDK";
        "strategy"=([StrategyType]::Core + [StrategyType]::Cpp);
        "submodules"=$false;
    };
    "./altv-docs-gta/"=@{
        "repo"="https://github.com/altmp/altv-docs-gta/";
        "name"="GTA";
        "strategy"=([StrategyType]::Core + [StrategyType]::GTA);
        "submodules"=$true;
    };
    "./altv-docs-assets/"=@{
        "repo"="https://github.com/altmp/altv-docs-assets/";
        "ref"="deploy";
        "name"="Assets";
        "strategy"=([StrategyType]::All);
        "submodules"=$false;
    };
}
$requiredPackages=[Ordered]@{
    "docfx"=@{
        "archive_name"="docfx.zip";
        "repo"="dotnet/docfx";
        "version"=$null;
        "predicate"="./docfx/docfx.exe";
        "dest"="./docfx/";
        "name"="DocFx";
        "strategy"=([StrategyType]::All);
    };
    "docfx-plugins-typescriptreference"=@{
        "archive_name"="docfx-plugins-typescriptreference.zip";
        "repo"="Unnvaldr/DocFx.Plugins.TypeScriptReference";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-typescriptreference/";
        "dest"="./templates/";
        "name"="DocFx TypeScriptReference";
        "strategy"=([StrategyType]::Core + [StrategyType]::JavaScript);
    };
    "docfx-plugins-addimagemodal"=@{
        "archive_name"="docfx-plugins-addimagemodal.zip";
        "repo"="Unnvaldr/DocFx.Plugins.AddImageModal";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-addimagemodal/";
        "dest"="./templates/";
        "name"="DocFx AddImageModal";
        "strategy"=([StrategyType]::All);
    };
    "docfx-plugins-extractsearchindex"=@{
        "archive_name"="docfx-plugins-extractsearchindex.zip";
        "repo"="Unnvaldr/DocFx.Plugins.ExtractSearchIndex";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-extractsearchindex/";
        "dest"="./templates/";
        "name"="DocFx ExtractSearchIndex";
        "strategy"=([StrategyType]::All);
    };
    "docfx-plugins-extractarticleaffix"=@{
        "archive_name"="docfx-plugins-extractarticleaffix.zip";
        "repo"="Unnvaldr/DocFx.Plugins.ExtractArticleAffix";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-extractarticleaffix/";
        "dest"="./templates/";
        "name"="DocFx ExtractArticleAffix";
        "strategy"=([StrategyType]::All);
    };
    "docfx-tmpls-discordfx"=@{
        "archive_name"="docfx-tmpls-discordfx.zip";
        "repo"="Unnvaldr/DiscordFx";
        "version"=$null;
        "predicate"="./templates/discordfx/";
        "dest"="./templates/";
        "name"="DocFx DiscordFx";
        "strategy"=([StrategyType]::All);
    };
}
$requiredTasks=[Ordered]@{
    "generate-js"=@{
        "strategy"=([StrategyType]::Core + [StrategyType]::JavaScript);
    };
    "generate-cs"=@{
        "strategy"=([StrategyType]::Core + [StrategyType]::CSharp);
    };
}

$tmpd=Join-Path -Path $([System.IO.Path]::GetTempPath()) -ChildPath "altv-docs"

# if (Test-Path -Path "Env:\GITHUB_ENV") {
#     foreach($el in $requiredPackages.GetEnumerator()) {
#         Write-Output "$($el.Key.Replace('-', '_').ToUpper())=$($el.Value["version"])" | Out-File -FilePath $Env:GITHUB_ENV -Encoding 'UTF-8' -Append
#     }
# }

$GITHUB_ENV_RAW=(Get-Content -Path "./.github/variables/vars.env")
$GITHUB_ENV=[Ordered]@{}
$GITHUB_ENV_RAW | %{ $tmp=$_.Split('='); $GITHUB_ENV[$tmp[0]]=$tmp[1] }
foreach($el in $requiredPackages.GetEnumerator()) {
    $envKey=$el.Key.ToUpper().Replace('-', '_')
    if (-not ($GITHUB_ENV.Contains($envKey))) {
        continue
    }
    $el.Value["version"]=$GITHUB_ENV[$envKey]
}

Export-ModuleMember -Variable requiredRepos, requiredPackages, requiredTasks, tmpd, pipeline
