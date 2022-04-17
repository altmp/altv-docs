param(
    [bool] $bypass=$false
)

if(-not $bypass) { throw "This script should not be executed from the console!" }

function PostCleanup() {
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

function GetAssemblyVersion([string] $file) {
    if(-not (Test-Path -Path $file)) { return "not found" }
    $ver=(Get-Item -Path $file | Select-Object -ExpandProperty VersionInfo).FileVersion.Split('.')
    if($ver.Length -lt 4) {
        $ver -Join '.'
    } else {
        ($ver | Select -SkipLast 1) -Join '.'
    }
}

function GetVisualStudioVersion() {
    if(-not (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe")) { return "not found" }
    $instances=& "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -products * -latest -format json | ConvertFrom-Json
    if($instances.Length -gt 0) {
        $instances[0].installationVersion
    } else {
        "none"
    }
}

function GetNodePackageManager() {
    return ((Get-Command "yarn" -ea SilentlyContinue), (Get-Command "npm" -ea SilentlyContinue) -ne $null)[0]
}

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

function RunNodePackage([string] $package) {
    $pkgCmd=GetNodePackageManager
    if(-not $pkgCmd) { return }
    if($pkgCmd.Name -like "yarn") {
        yarn run $package $args
    } else {
        npx $package $args
    }
}

function IsVisualStudioInstalled() {
    if(-not (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe")) { $false; return }
    $instances=& "C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -products * -requires Microsoft.NetCore.Component.SDK -latest -format json | ConvertFrom-Json
    $instances.Length -gt 0
}

function FetchAndDownloadRelease([string] $repo, [string] $path, [string] $archive, [string] $tag=$null) {
    $global:ProgressPreference='SilentlyContinue'
    if(-not $tag) {
        $tag=((Invoke-WebRequest -UseBasicParsing "https://api.github.com/repos/$repo/releases" | ConvertFrom-Json) | Where-Object { -not $_.prerelease } | Select-Object -First 1 -ExpandProperty "tag_name")
    }
    Invoke-WebRequest -UseBasicParsing "https://github.com/$repo/releases/download/$tag/$archive" -OutFile "$path/$archive"
    $global:ProgressPreference='Continue'
    return ([int]$? - 1)
}

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

function Run-Task {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string] $caption,
        [Parameter(Mandatory=$false)]
        [ScriptBlock] $scriptBlock,
        [Parameter(Mandatory=$false)]
        [ScriptBlock] $predicate={ $true }
    )
    process {
        if (-not $(Invoke-Command -ScriptBlock $predicate)) {
            return
        }
        Write-Host -NoNewline "$caption . . . "
        $action={ Exit-Task $(if($LastExitCode -ne 0x0) { $LastExitCode } else { 1 - [int]$? }) }
        $strm=Invoke-Command -ScriptBlock ([ScriptBlock]::Create("do{" + $scriptBlock.ToString() + "`n" + $action.ToString() + "}while(`$false);")) -ErrorVariable err *>&1
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

[Flags()]
enum StrategyType {
    Core = 1
    JavaScript = 2
    CSharp = 4
    Cpp = 8
    GTA = 16
    All = 255
}

$requiredRepos=[Ordered]@{
    "./altv-types/"=@{
        "repo"="https://github.com/altmp/altv-types/";
        "name"="JS";
        "strategy"=([StrategyType]::Core + [StrategyType]::JavaScript);
    };
    "./coreclr-module/"=@{
        "repo"="https://github.com/FabianTerhorst/coreclr-module";
        "name"="C#";
        "strategy"=([StrategyType]::Core + [StrategyType]::CSharp);
    };
    "./cpp-sdk/"=@{
        "repo"="https://github.com/altmp/cpp-sdk/";
        "ref"="docs";
        "name"="SDK";
        "strategy"=([StrategyType]::Core + [StrategyType]::Cpp);
    };
    "./altv-docs-gta/"=@{
        "repo"="https://github.com/altmp/altv-docs-gta/";
        "name"="GTA";
        "strategy"=([StrategyType]::Core + [StrategyType]::GTA);
    };
    "./altv-docs-assets/"=@{
        "repo"="https://github.com/altmp/altv-docs-assets/";
        "ref"="deploy";
        "name"="Assets";
        "strategy"=([StrategyType]::All);
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

# if (Test-Path -Path "Env:\GITHUB_ENV") {
#     foreach($el in $requiredPackages.GetEnumerator()) {
#         Write-Output "$($el.Key.Replace('-', '_').ToUpper())=$($el.Value["version"])" | Out-File -FilePath $Env:GITHUB_ENV -Encoding 'UTF-8' -Append
#     }
# }

$GITHUB_ENV_RAW=(Get-Content -Path "./.github/variables/vars.env")
$GITHUB_ENV=[Ordered]@{}
($GITHUB_ENV_RAW | %{ $tmp=$_.Split('='); $GITHUB_ENV[$tmp[0]]=$tmp[1] })
foreach($el in $requiredPackages.GetEnumerator()) {
    $envKey=$el.Key.ToUpper().Replace('-', '_')
    if (-not ($GITHUB_ENV.Contains($envKey))) {
        continue
    }
    $el.Value["version"]=$GITHUB_ENV[$envKey]
}
