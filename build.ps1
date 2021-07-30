param(
    [string] $port="8080",
    [Switch] $cleanMetadata=$false,
    [Switch] $cleanOnly=$false
)

$requiredRepos=[Ordered]@{
    "./altv-types/"=@{
        "repo"="https://github.com/altmp/altv-types/";
        "ref"="master";
        "name"="JS";
    };
    "./coreclr-module/"=@{
        "repo"="https://github.com/FabianTerhorst/coreclr-module";
        "ref"="master";
        "name"="C#";
    };
    "./cpp-sdk/"=@{
        "repo"="https://github.com/altmp/cpp-sdk/";
        "ref"="docs";
        "name"="SDK";
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
    "docfx-plugins-extractsearchindex.zip"=@{
        "repo"="Lhoerion/DocFx.Plugins.ExtractSearchIndex";
        "version"=$null;
        "predicate"="./templates/docfx-plugins-extractsearchindex/";
        "dest"="./templates/";
        "name"="DocFx ExtractSearchIndex";
    };
    "docfx-tmpls-discordfx.zip"=@{
        "repo"="Lhoerion/DiscordFX";
        "version"=$null;
        "predicate"="./templates/discordfx/";
        "dest"="./templates/";
        "name"="DocFx DiscordFX";
    };
}

$global:ProgressPreference='SilentlyContinue'
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/altmp/altv-docs/master/common.ps1" -OutFile "./common.ps1" 2>&1 >$null
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
            New-Item -ItemType "directory" -Path $el.Key -Force
            Set-Location -Path $el.Key
            git init
            git remote add "origin" $el.Value["repo"]
            git fetch --depth 1 "origin" $el.Value["ref"]
            git merge "FETCH_HEAD"
            git reset --hard "HEAD"
            git branch --set-upstream-to "origin/$($el.Value["ref"])" master
            Set-Location $cwd
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

    # Run-Task "Checkout JS repository" {
    #     if(Test-Path "./altv-types/") {
    #         Set-Location -Path "./altv-types/"
    #         git fetch --depth 1 "origin" "master"
    #         if((git status -s -b) -like "*``[*behind *``]") {
    #             git clean -d -x -f
    #             git reset --hard "FETCH_HEAD"
    #             Set-Location $cwd
    #             Exit-Task (0x0)
    #         } else {
    #             Set-Location $cwd
    #             Exit-Task (-0x1)
    #         }
    #     }
    #     New-Item -ItemType "directory" -Path "./altv-types/" -Force
    #     Set-Location -Path "./altv-types/"
    #     git init
    #     git remote add "origin" "https://github.com/altmp/altv-types/"
    #     git fetch --depth 1 "origin" "master"
    #     git merge "FETCH_HEAD"
    #     git reset --hard "HEAD"
    #     git branch --set-upstream-to "origin/master" "master"
    #     Set-Location $cwd
    # }

    # Run-Task "Checkout C# repository" {
    #     if(Test-Path "./coreclr-module/") {
    #         Set-Location -Path "./coreclr-module/"
    #         git fetch --depth 1 "origin" "master"
    #         if((git status -s -b) -like "*``[*behind *``]") {
    #             git clean -d -x -f
    #             git reset --hard "FETCH_HEAD"
    #             Set-Location $cwd
    #             Exit-Task (0x0)
    #         } else {
    #             Set-Location $cwd
    #             Exit-Task (-0x1)
    #         }
    #     }
    #     New-Item -ItemType "directory" -Path "./coreclr-module/" -Force
    #     Set-Location -Path "./coreclr-module/"
    #     git init
    #     git remote add "origin" "https://github.com/FabianTerhorst/coreclr-module/"
    #     git fetch --depth 1 "origin" "master"
    #     git merge "FETCH_HEAD"
    #     git reset --hard "HEAD"
    #     git branch --set-upstream-to "origin/master" "master"
    #     Set-Location $cwd
    # }

    # Run-Task "Checkout SDK repository" {
    #     if(Test-Path "./cpp-sdk/") {
    #         Set-Location -Path "./cpp-sdk/"
    #         git fetch --depth 1 "origin" "master"
    #         if((git status -s -b) -like "*``[*behind *``]") {
    #             git clean -d -x -f
    #             git reset --hard "FETCH_HEAD"
    #             Set-Location $cwd
    #             Exit-Task (0x0)
    #         } else {
    #             Set-Location $cwd
    #             Exit-Task (-0x1)
    #         }
    #     }
    #     New-Item -ItemType "directory" -Path "./cpp-sdk/" -Force
    #     Set-Location -Path "./cpp-sdk/"
    #     git init
    #     git remote add "origin" "https://github.com/altmp/cpp-sdk/"
    #     git fetch --depth 1 "origin" "docs"
    #     git merge "FETCH_HEAD"
    #     git reset --hard "HEAD"
    #     git branch --set-upstream-to "origin/docs" "master"
    #     Set-Location $cwd
    # }

    # Run-Task "Downloading DocFx package" {
    #     if(Test-Path "./docfx/docfx.exe") { Exit-Task (-0x1) }
    #     FetchAndDownloadRelease "dotnet/docfx" "$tmpd/" "docfx.zip" "v2.58"
    # }
    # Run-Task "Extracting DocFx package" {
    #     if(Test-Path "./docfx/docfx.exe") { Exit-Task (-0x1) }
    #     ExtractArchive "$tmpd/docfx.zip" "./docfx/"
    # }

    # Run-Task "Downloading DocFx TypeScriptReference package" {
    #     if(Test-Path "./templates/docfx-plugins-typescriptreference/") { Exit-Task (-0x1) }
    #     FetchAndDownloadRelease "Lhoerion/DocFx.Plugins.TypeScriptReference" "$tmpd/" "docfx-plugins-typescriptreference.zip" "v1.1.5"
    # }
    # Run-Task "Extracting DocFx TypeScriptReference package" {
    #     if(Test-Path "./templates/docfx-plugins-typescriptreference/") { Exit-Task (-0x1) }
    #     ExtractArchive "$tmpd/docfx-plugins-typescriptreference.zip" "./templates/"
    # }

    # Run-Task "Downloading DocFx ExtractSearchIndex package" {
    #     if(Test-Path "./templates/docfx-plugins-extractsearchindex/") { Exit-Task (-0x1) }
    #     FetchAndDownloadRelease "Lhoerion/DocFx.Plugins.ExtractSearchIndex" "$tmpd/" "docfx-plugins-extractsearchindex.zip" "v1.0.1"
    # }
    # Run-Task "Extracting DocFx ExtractSearchIndex package" {
    #     if(Test-Path "./templates/docfx-plugins-extractsearchindex/") { Exit-Task (-0x1) }
    #     ExtractArchive "$tmpd/docfx-plugins-extractsearchindex.zip" "./templates/"
    # }

    # Run-Task "Downloading DocFx DiscordFX package" {
    #     if(Test-Path "./templates/discordfx/") { Exit-Task (-0x1) }
    #     FetchAndDownloadRelease "Lhoerion/DiscordFX" "$tmpd/" "docfx-tmpls-discordfx.zip"
    # }
    # Run-Task "Extracting DocFx DiscordFX package" {
    #     if(Test-Path "./templates/discordfx/") { Exit-Task (-0x1) }
    #     ExtractArchive "$tmpd/docfx-tmpls-discordfx.zip" "./templates/"
    # }

    Run-Task "Tools version" {
        Set-Location $cwd
        $tools=[Ordered]@{
            "Node.js"=(node -v);
            "Yarn/npm"=GetNodePackageVersion;
            "Visual Studio"=GetVisualStudioVersion;
            "DocFx"=GetAssemblyVersion "./docfx/docfx.exe";
            "DocFx TypeScriptReference"=GetAssemblyVersion "./templates/docfx-plugins-typescriptreference/plugins/DocFx.*.dll";
            "DocFx ExtractSearchIndex"=GetAssemblyVersion "./templates/docfx-plugins-extractsearchindex/plugins/DocFx.*.dll";
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
