$PSDefaultParameterValues['*:Encoding'] = 'utf8'

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
"$Env:SystemRoot\SysWOW64\HKHttpComm.dll"
"$Env:SystemRoot\SysWOW64\CMBPBHK.exe"
"$Env:SystemRoot\SysWOW64\hkpbhelp.chm"
"$Env:SystemRoot\SysWOW64\CmbPbHk.ocx"
"$Env:SystemRoot\SysWOW64\CMBBaseHK.ocx"
"$Env:SystemRoot\SysWOW64\Cmb_PbHK_LiveUpdateGB.exe"
"$Env:SystemRoot\SysWOW64\Big5ToGB.dat"
"$Env:SystemRoot\SysWOW64\GBToBig5.dat"
"$Env:PUBLIC\Desktop\个人银行香港专业版.lnk"
"$Env:ProgramData\Microsoft\Windows\Start Menu\Programs\个人银行香港专业版.lnk"
)

$CMB_CLIENT_REGISTRY_ITEMS = @(
"HKCR:\CMBBase.PBBase"
"HKCR:\CMBBase.PBBase.1"
"HKCR:\Interface\{4D6D7ED5-762C-4C5B-B8AE-6B1183DDBE43}"
"HKCR:\Interface\{A7CBD462-8F62-4082-9FF5-180C7DB11A73}"
"HKCR:\Interface\{C3CD1044-1ADA-43F9-8D45-388CB2126CBF}"
"HKCR:\PbHkActiveProj.PbHkActiveX"
"HKCR:\TypeLib\{11A6A8A8-ACF7-4296-B288-67152E1D68F2}"
"HKCR:\TypeLib\{C510569E-52BC-446C-894A-12B44C112013}"
"HKCR:\WOW6432Node\CLSID\{3E0F7E68-A21F-4492-89D1-F76C29ADD8ED}"
"HKCR:\WOW6432Node\CLSID\{4F9FA543-FABC-4B68-B2C4-01DF6EA8EB51}"
"HKCR:\WOW6432Node\Interface\{4D6D7ED5-762C-4C5B-B8AE-6B1183DDBE43}"
"HKCR:\WOW6432Node\Interface\{A7CBD462-8F62-4082-9FF5-180C7DB11A73}"
"HKCR:\WOW6432Node\Interface\{C3CD1044-1ADA-43F9-8D45-388CB2126CBF}"
"HKCU:\SOFTWARE\CMB"
"HKLM:\SOFTWARE\WOW6432Node\CMB"
)

$CMB_CLIENT_FILE_ITEMS = @(
"$Env:SystemRoot\SysWOW64\HKHttpComm.dll"
"$Env:SystemRoot\SysWOW64\CMBPBHK.exe"
"$Env:SystemRoot\SysWOW64\hkpbhelp.chm"
"$Env:SystemRoot\SysWOW64\CmbPbHk.ocx"
"$Env:SystemRoot\SysWOW64\CMBBaseHK.ocx"
"$Env:SystemRoot\SysWOW64\Cmb_PbHK_LiveUpdateGB.exe"
"$Env:SystemRoot\SysWOW64\Big5ToGB.dat"
"$Env:SystemRoot\SysWOW64\GBToBig5.dat"
"$Env:PUBLIC\Desktop\个人银行香港专业版.lnk"
"$Env:ProgramData\Microsoft\Windows\Start Menu\Programs\个人银行香港专业版.lnk"
)

$CMB_SAFE_EDIT_FILE_ITEMS = @(
"$Env:SystemRoot\SysWOW64\CMBEdit.dll"
"$Env:ProgramFiles(x86)\InstallShield Installation Information\{BFB8DF2C-170D-4A5D-9AFE-4307B09448A8}"
)

$CMB_SAFE_EDIT_REGISTRY_ITEMS = @(
"HKLM:\SOFTWARE\Classes\TypeLib\{C4DB7141-5F89-4D2F-9CBD-062377F9BB63}"
"HKLM:\SOFTWARE\Classes\WOW6432Node\CLSID\{0CA54D3F-CEAE-48AF-9A2B-31909CB9515D}"
"HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{BFB8DF2C-170D-4A5D-9AFE-4307B09448A8}"
)

Stop-Process -Name CMBPBHK -Force -ErrorAction SilentlyContinue
Remove-Items -Items $CMB_CLIENT_FILE_ITEMS
Remove-Items -Items $CMB_CLIENT_REGISTRY_ITEMS
Remove-Items -Items $CMB_SAFE_EDIT_FILE_ITEMS
Remove-Items -Items $CMB_SAFE_EDIT_REGISTRY_ITEMS
