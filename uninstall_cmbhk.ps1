Stop-Process -Name CMBPBHK -Force -ErrorAction SilentlyContinue

$CMB_FILES = @(
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

$CMB_REGISTRY_ITEMS = @(
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

Foreach($CMB_FILE_PATH in $CMB_FILES)  
{  
     Remove-Item -Path $CMB_FILE_PATH -Force -Recurse -ErrorAction SilentlyContinue
}

Foreach($CMB_REGISTRY_PATH in $CMB_REGISTRY_ITEMS)  
{  
     Remove-Item -Path $CMB_REGISTRY_PATH -Force -Recurse -ErrorAction SilentlyContinue
}
