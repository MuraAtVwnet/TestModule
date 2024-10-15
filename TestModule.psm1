function TestFunction([switch]$VertionCheck){

	# バージョンチェックとオンライン更新
	if( $VertionCheck ){
		$ModuleName = "TestModule"
		$GitHubName = "MuraAtVwnet"

		$Module = $ModuleName + ".psm1"
		$Installer = "Install" + $ModuleName + ".ps1"
		$UnInstaller = "UnInstall" + $ModuleName + ".ps1"
		$Vertion = "Vertion" + $ModuleName + ".txt"
		$VertionTemp = "VertionTemp" + $ModuleName + ".tmp"

		$Update = $False

		if( -not (Test-Path ~/$Vertion)){
			$Update = $True
		}
		else{
			# 現在のバージョン
			$LocalVertion = Get-Content -Path ~/$Vertion

			# ローカルにリポジトリに置いてあるバージョン管理ファイルをダウンロードし読み込む
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/Vertion.txt -OutFile ~/$VertionTemp
			$NowVertion = Get-Content -Path ~/$VertionTemp
			Remove-Item ~/$VertionTemp

			# バージョン チェック
			if( $LocalVertion -ne $NowVertion ){
				$Update = $True
			}
		}

		if( $Update ){
			Write-Output "最新版に更新します"
			Write-Output "更新完了後、PowerShell プロンプトを開きなおしてください"
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/$Module -OutFile ~/$Module
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/install.ps1 -OutFile ~/$Installer
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/uninstall.ps1 -OutFile ~/$UnInstaller
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/Vertion.txt -OutFile ~/$Vertion
			& ~/$Installer
			Remove-Item ~/$Module
			Remove-Item ~/$Installer
			Write-Output "更新完了"
			Write-Output "PowerShell プロンプトを開きなおしてください"
		}
		else{
			Write-Output "更新の必要はありません"
		}
		return
	}

	$Now = (Get-Date).ToString()
	$EchoString = "現在時刻は " + $Now + " です"
	Write-Output $EchoString
}

