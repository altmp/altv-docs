param(
    [string] $port="8080",
    [Switch] $cleanMetadata=$false,
    [Switch] $cleanOnly=$false
)

$requiredRepos=[Ordered]@{
    "./altv-types/"=@{
        "repo"="https://github.com/altmp/altv-types/";
        "name"="JS";
    };
    "./coreclr-module/"=@{
        "repo"="https://github.com/FabianTerhorst/coreclr-module";
        "name"="C#";
    };
    "./cpp-sdk/"=@{
        "repo"="https://github.com/altmp/cpp-sdk/";
        "ref"="docs";
        "name"="SDK";
    };
    "./altv-docs-gta/"=@{
        "repo"="https://github.com/altmp/altv-docs-gta/";
        "name"="GTA";
    };
    "./altv-docs-assets/"=@{
        "repo"="https://github.com/altmp/altv-docs-assets/";
        "ref"="deploy";
        "name"="Assets";
    };
}
$requiredPackages=[Ordered]@{
    "docfx.zip"=@{
        "repo"="dotnet/docfx";
        "version"=$null;
        "predicate"="./docfx/docfx.exe";
        "dest"="./docfx/";
        "name"="DocFx";
    };
    "docfx-plugins-typescriptreference.zip"=@{
        "repo"="Lhoerion/DocFx.Plugins.TypeScriptReference";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-typescriptreference/";
        "dest"="./templates/";
        "name"="DocFx TypeScriptReference";
    };
    "docfx-plugins-addimagemodal.zip"=@{
        "repo"="Lhoerion/DocFx.Plugins.AddImageModal";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-addimagemodal/";
        "dest"="./templates/";
        "name"="DocFx AddImageModal";
    };
    "docfx-plugins-extractsearchindex.zip"=@{
        "repo"="Lhoerion/DocFx.Plugins.ExtractSearchIndex";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-extractsearchindex/";
        "dest"="./templates/";
        "name"="DocFx ExtractSearchIndex";
    };
    "docfx-plugins-extractarticleaffix.zip"=@{
        "repo"="Lhoerion/DocFx.Plugins.ExtractArticleAffix";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-extractarticleaffix/";
        "dest"="./templates/";
        "name"="DocFx ExtractArticleAffix";
    };
    "docfx-tmpls-discordfx.zip"=@{
        "repo"="Lhoerion/DiscordFx";
        "version"=$null;
        "predicate"="./templates/discordfx/";
        "dest"="./templates/";
        "name"="DocFx DiscordFx";
    };
}

$global:ProgressPreference='SilentlyContinue'
Invoke-WebRequest -UseBasicParsing -Headers @{"Cache-Control"="no-cache"} "https://raw.githubusercontent.com/altmp/altv-docs/$(git rev-parse --abbrev-ref HEAD)/common.ps1" -OutFile "./common.ps1" 2>&1 >$null
$global:ProgressPreference='Continue'
if($err -ne $null -or -not (Test-Path "./common.ps1")) { throw "Script common.ps1 not found." }
. "./common.ps1" $true

try
{
    $cwd=(Get-Location).Path
    $tmpd="${env:TMP}/altv-docs"
    New-Item -ItemType "Directory" -Path "$tmpd" 2>&1 >$null

    if($cleanOnly) { exit }

    foreach($el in $requiredRepos.GetEnumerator()) {
        Run-Task "Checkout $($el.Value["name"]) repository" {
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
        }
    }

    foreach($el in $requiredPackages.GetEnumerator()) {
        Run-Task "Downloading $($el.Value["name"]) package" {
            if(Test-Path $el.Value["predicate"]) { Exit-Task (-0x1) }
            FetchAndDownloadRelease $el.Value["repo"] "$tmpd/" $el.Key $el.Value["version"]
        }
        Run-Task "Extracting $($el.Value["name"]) package" {
            if(Test-Path $el.Value["predicate"]) { Exit-Task (-0x1) }
            ExtractArchive "$tmpd/$($el.Key)" $el.Value["dest"]
        }
    }

    Run-Task "Tools version" {
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
    }

    Run-Task "Generating JS project metadata" {
        Set-Location -Path "./altv-types/docs/"
        $pkgCmd=GetNodePackageManager
        if(-not $pkgCmd) { Exit-Task (0x1) }
        if(-not (Test-Path "../node_modules/")) { & $pkgCmd install }
        RunNodePackage "typedoc" --options "./typedoc.json"
        RunNodePackage "type2docfx" "./api/.manifest" "./api/" --basePath "." --sourceUrl "https://github.com/altmp/altv-types" --sourceBranch "master" --disableAlphabetOrder
        Set-Location $cwd
    }
    Run-Task "Generating C# project metadata" {
        if(IsVisualStudioInstalled) {
            ./docfx/docfx metadata "./coreclr-module/docs/docfx.json"
        } else {
            New-Item -Path "./coreclr-module/docs/api/toc.yml" -Value "# Autogenerated file to prevent missing file error`n[]`n" -Force
            Exit-Task (-0x1)
        }
    }

    ./docfx/docfx build "docfx.json" --intermediateFolder "$tmpd/obj/" --serve -p $port
}
finally
{
    Set-Location $cwd
    PostCleanup
}
