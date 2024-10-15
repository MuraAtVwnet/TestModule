function TestFunction(){
	$Now = (Get-Date).ToString()
	$EchoString = "現在時刻は " + $Now + " です"
	Write-Output $EchoString
}

