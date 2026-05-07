param(
    [switch]$clean
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

if ($clean -and (Test-Path "$root/build")) {
    Remove-Item -LiteralPath "$root/build" -Recurse -Force
}

qpm restore
$ndk = (qpm ndk resolve).Trim()
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_ANDROID_NDK="$ndk"
cmake --build build --config RelWithDebInfo

