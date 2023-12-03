# Define paths
$imageWallpaperPath = "C:\Users\Andre\OneDrive\Pictures\wallpaper2.jpg"
$blackWallpaperPath = "C:\Users\Andre\OneDrive\Pictures\black_wallpaper.jpg"

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

function Set-Wallpaper($path) {
    Write-Host "Setting wallpaper to: $path"
    [Wallpaper]::SystemParametersInfo(20, 0, $path, 3)
}

# Read the current wallpaper path (optional, for toggling logic)
$currentWallpaper = (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop\').wallpaper
Write-Host "Current wallpaper: $currentWallpaper"

# Toggle the wallpaper
if ($currentWallpaper -eq $imageWallpaperPath) {
    Write-Host "Switching to black wallpaper"
    Set-Wallpaper -path $blackWallpaperPath
} else {
    Write-Host "Switching to image wallpaper"
    Set-Wallpaper -path $imageWallpaperPath
}