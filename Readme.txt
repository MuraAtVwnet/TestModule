# 以下コマンドでインストール

$ModuleName = "TestModule"
$GitHubName = "MuraAtVwnet"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/OnlineInstall.ps1 -OutFile ~/OnlineInstall.ps1
& ~/OnlineInstall.ps1


<#
このリポジトリは、以下コンテンツで使用しているリポジトリです

作成した PowerShell 関数のモジュール化とオンラインインストール/オンライン更新の実装
https://www.vwnet.jp/Windows/PowerShell/2024101501/PowerShellModuleOnlineInstallUpdate.htm
#>
