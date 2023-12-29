$blackWallpaperPath = "C:\Users\Andre\OneDrive\Pictures\black_wallpaper.jpg"

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

Write-Host "Setting wallpaper to: $blackWallpaperPath"
[Wallpaper]::SystemParametersInfo(20, 0, $blackWallpaperPath, 3)