#include <WinAPIMem.au3>
#include <WinAPIProc.au3>

$exe = "WATclient-DX9.exe"
$address = 0x98F69C

$hProcess = ProcessExists($exe)
$pBuf = DllStructCreate("int")
$iRead = 0
$hProc = _WinAPI_OpenProcess(0x1F0FFF, False, $hProcess) ;0x1F0FFF = PROCESS_ALL_ACCESS

_WinAPI_ReadProcessMemory($hProc, 0x98F69C, DllStructGetPtr($pBuf), DllStructGetSize($pBuf), $iRead)

MsgBox(0, "", DllStructGetData($pBuf, 1))