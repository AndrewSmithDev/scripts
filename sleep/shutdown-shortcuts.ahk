^#h::  ; hibernate - Ctrl+Win+H hotkey
    Run, C:\Windows\System32\shutdown.exe /h 
return
^#p::  ; sleep - Ctrl+Win+P hotkey
    Run, % "rundll32.exe powrprof.dll,SetSuspendState 0,1,0", , Hide
return
