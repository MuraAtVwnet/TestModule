# モジュール名
$ModuleName = "TestModule"

# モジュール Path
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"

# モジュールを配置する Path
$NewPath = Join-Path $ModulePath $ModuleName

# ディレクトリ作成
if( -not (Test-Path $NewPath)){
	New-Item $NewPath -ItemType Directory
}

# モジュールのコピー
$ModuleFileName = Join-Path $PSScriptRoot ($ModuleName + ".psm1")
Copy-Item $ModuleFileName $NewPath

# バージョンファイルのコピー
$Vertion = "Vertion" + $ModuleName + ".txt"
$VertionFileName = Join-Path $PSScriptRoot "Vertion.txt"

# オンラインインストール時のバージョンファイル
if( -not $VertionFileName ){
	$VertionFileName = Join-Path $PSScriptRoot $Vertion
}

Copy-Item $VertionFileName ~/$Vertion

