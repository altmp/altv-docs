param(
    [string] $port="8080",
    [Switch] $cleanMetadata=$false,
    [Switch] $cleanOnly=$false
)

if(-not (($strategyType -ne 0) -band(($strategyType -band ($strategyType - 1)) -eq 0))) { throw "Strategy type argument must be a power of 2!" }

$global:ProgressPreference='SilentlyContinue'
$BRANCH=$(git rev-parse --abbrev-ref HEAD)
$REPO="altmp/altv-docs"
$RAWGIT="https://raw.githubusercontent.com"
Invoke-WebRequest -UseBasicParsing -Headers @{"Cache-Control"="no-cache"} "$RAWGIT/$REPO/$BRANCH/build.psm1" -OutFile "./build.psm1" 2>&1 >$null
$global:ProgressPreference='Continue'
if($err -ne $null -or -not (Test-Path "./build.psm1")) { throw "Script build.psm1 not found." }
$module=Import-Module "./build.psm1" -PassThru -Force

$strategy=[StrategyType]::Core

try
{
    $cwd=(Get-Location).Path
    . $pipeline
}
finally
{
    Set-Location $cwd
    PostCleanup
    Remove-Module $module
}
