
$pg_config = (Get-Command -ErrorAction SilentlyContinue "pg_config.exe").Path
if (Test-Path env:PGHOME) {
    $pg_config = Resolve-Path (Join-Path $env:PGHOME "bin\pg_config.exe")
}

if ('' -eq [string]$pg_config) {
    throw "pg_config not found"
}

$env:PG_CONFIG = $pg_config

Push-Location $PSScriptRoot
try {
    & ./msys64.cmd -c /build.sh
}
finally {
    Pop-Location
}
