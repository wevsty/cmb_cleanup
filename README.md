# cmb_cleanup introduction
CMB(China Merchants Bank) software cleanup utility

# 简介
由于招商银行的网银客户端提供的卸载程序并不能完整的卸载客户端，故有了本项目。

适配版本:


招商银行网银专业版客户端 7.7.2


招商银行香港分行的网银客户端 4.2.3.2


# 使用方法
使用管理员权限打开powershell

## 卸载招商银行网银专业版
```powershell
$ScriptFromGitHub = (Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/wevsty/cmb_cleanup/main/uninstall_cmb.ps1)
Invoke-Expression $($ScriptFromGitHub.Content)
```
备注：由于客户端带有驱动，需重启后才能完整删除。

## 卸载招商银行香港分行网银专业版
```powershell
$ScriptFromGitHub = (Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/wevsty/cmb_cleanup/main/uninstall_cmbhk.ps1)
Invoke-Expression $($ScriptFromGitHub.Content)
```
