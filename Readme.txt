﻿以下コマンドでインストール

$ModuleName = "TestModule"
$GitHubName = "MuraAtVwnet"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/OnlineInstall.ps1 -OutFile ~/OnlineInstall.ps1
& ~/OnlineInstall.ps1
