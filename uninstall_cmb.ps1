
# Keep empty line
Add-Type @"
using System;
using System.Text;
using System.Runtime.InteropServices;

public class PFRO
{
    public enum MoveFileFlags
    {
        MOVEFILE_REPLACE_EXISTING           = 0x00000001,
        MOVEFILE_COPY_ALLOWED               = 0x00000002,
        MOVEFILE_DELAY_UNTIL_REBOOT         = 0x00000004,
        MOVEFILE_WRITE_THROUGH              = 0x00000008,
        MOVEFILE_CREATE_HARDLINK            = 0x00000010,
        MOVEFILE_FAIL_IF_NOT_TRACKABLE      = 0x00000020
    }
    [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
    static extern bool MoveFileEx(string lpExistingFileName, string lpNewFileName, MoveFileFlags dwFlags);

    public static bool MarkFileForDelete (string srcfile)
    {
        bool brc = false;
        brc = MoveFileEx(srcfile, null, MoveFileFlags.MOVEFILE_DELAY_UNTIL_REBOOT);
        return brc;
    }
}
"@

function Remove-Items {
    param (
        [string[]]$Items
    )

    foreach ($Item in $Items) {
        Remove-Item -Path $Item -Force -Recurse -ErrorAction SilentlyContinue
		Write-Output "Remove: $Item"
    }
}

$CMB_CLIENT_FILE_ITEMS = @(
"$Env:SystemRoot\SysWOW64\CMBRes"
"$Env:SystemRoot\SysWOW64\PBHttpComm.dll"
"$Env:SystemRoot\SysWOW64\PersonalBankPortal.exe"
"$Env:SystemRoot\SysWOW64\PersonalBankNetpay.exe"
"$Env:SystemRoot\SysWOW64\PBCMBLgCtrl.dll"
"$Env:SystemRoot\SysWOW64\PBCMBQRencode.dll"
"$Env:SystemRoot\SysWOW64\PBCMBGetWindow.dll"
"$Env:SystemRoot\SysWOW64\PBCMBSet.dll"
"$Env:SystemRoot\SysWOW64\FinanceMgr.dll"
"$Env:SystemRoot\SysWOW64\cmbpbhelp.chm"
"$Env:SystemRoot\SysWOW64\CmbSafeBase.dll"
"$Env:SystemRoot\SysWOW64\PersonalBankMain.ocx"
"$Env:SystemRoot\SysWOW64\Cmb_Pb_LiveUpdate.exe"
"$Env:SystemRoot\SysWOW64\PBFinanceMgr"
"$Env:SystemRoot\SysWOW64\drivers\CMBProtector.dat"
"$Env:SystemRoot\SysWOW64\drivers\CertClient.dat"
"$Env:SystemRoot\SysWOW64\AntiPrtScX64Exe.exe"
"$Env:SystemRoot\SysWOW64\UpdateCMBAtPtSn_x64.dll"
"$Env:SystemRoot\SysWOW64\UpdateCMBAtPtSn.dll"
"$Env:SystemRoot\SysWOW64\PbLiveUpdate.xml"
"$Env:SystemRoot\SysWOW64\PersonalBankMain.ocx"
"$Env:SystemRoot\SysWOW64\CmbSafeBase.dll"
"$Env:SystemRoot\SysWOW64\CMBEdit.dll"
"$Env:PUBLIC\Desktop\招商银行专业版.lnk"
"$Env:ProgramData\Microsoft\Windows\Start Menu\Programs\招商银行专业版.lnk"
"$Env:USERPROFILE\CMB"
)

$CMB_CLIENT_REGISTRY_ITEMS = @(
"HKCR:\CMBPB"
"HKCR:\Interface\{15D2AB7C-A76C-41F4-812E-D6502C505B1D}"
"HKCR:\Interface\{629101D6-1715-40CB-88B6-44BB8F5165A6}"
"HKCR:\Interface\{72605BE0-8595-49C7-AA77-FAD5C35668E4}"
"HKCR:\Interface\{9D663802-F6C2-458E-A9B4-72654402AFF8}"
"HKCR:\PBActiveXProj.PBActiveX"
"HKCR:\TypeLib\{96774C7C-0A32-4FE4-B3DD-8E32FA9C7248}"
"HKCR:\TypeLib\{C4DB7141-5F89-4D2F-9CBD-062377F9BB63}"
"HKCR:\TypeLib\{E0EE36A8-F883-4588-9C20-CD9E27CEE220}"
"HKCR:\VC2BCTest.VC2MyEdit"
"HKCR:\VC2BCTest.VC2MyEdit.1"
"HKCR:\WOW6432Node\CLSID\{D2B10F3C-CF07-4F4A-9FB1-B956B8C6CB72}"
"HKCR:\WOW6432Node\CLSID\{DC0D755B-EA1F-4E85-B7F7-B2E3A4AEB918}"
"HKCR:\WOW6432Node\CLSID\{DFA1D538-0BE7-4E33-BB7E-CA6F90E5F2B2}"
"HKCR:\WOW6432Node\CLSID\{F2EB8999-766E-4BF6-AAAD-188D398C0D0B}"
"HKCR:\WOW6432Node\Interface\{15D2AB7C-A76C-41F4-812E-D6502C505B1D}"
"HKCR:\WOW6432Node\Interface\{629101D6-1715-40CB-88B6-44BB8F5165A6}"
"HKCR:\WOW6432Node\Interface\{72605BE0-8595-49C7-AA77-FAD5C35668E4}"
"HKCR:\WOW6432Node\Interface\{9D663802-F6C2-458E-A9B4-72654402AFF8}"
"HKCU:\SOFTWARE\CMB"
"HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\CMBPB40"
"HKLM:\System\CurrentControlSet\Services\CMB8100"
"HKLM:\System\CurrentControlSet\Services\CMBProtector"
)

$CMB_SAFE_EDIT_FILE_ITEMS = @(
"$Env:SystemRoot\SysWOW64\CMBEdit.dll"
"$env:ProgramFiles(x86)\InstallShield Installation Information\{BFB8DF2C-170D-4A5D-9AFE-4307B09448A8}"
)

$CMB_SAFE_EDIT_REGISTRY_ITEMS = @(
"HKLM:\SOFTWARE\Classes\TypeLib\{C4DB7141-5F89-4D2F-9CBD-062377F9BB63}"
"HKLM:\SOFTWARE\Classes\WOW6432Node\CLSID\{0CA54D3F-CEAE-48AF-9A2B-31909CB9515D}"
"HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{BFB8DF2C-170D-4A5D-9AFE-4307B09448A8}"
)

Stop-Process -Name PersonalBankPortal -Force -ErrorAction SilentlyContinue
Remove-Items -Items $CMB_CLIENT_FILE_ITEMS
Remove-Items -Items $CMB_CLIENT_REGISTRY_ITEMS
Remove-Items -Items $CMB_SAFE_EDIT_FILE_ITEMS
Remove-Items -Items $CMB_SAFE_EDIT_REGISTRY_ITEMS

$CMB_DRIVERS = @(
"$Env:SystemRoot\SysWOW64\drivers\CMBProtector.dat"
"$Env:SystemRoot\SysWOW64\drivers\CertClient.dat"
)

Foreach($DRIVER_PATH in $CMB_DRIVERS)  
{
    $CMD_RESULT = (Test-Path $DRIVER_PATH)
    if($CMD_RESULT -eq $true)
    {
        if([PFRO]::MarkFileForDelete($DRIVER_PATH))
        {
            write-host $DRIVER_PATH "will be deleted on next boot"
        }
    }
}
