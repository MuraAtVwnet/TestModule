# モジュール名
$ModuleName = "TestModule"

# モジュール Path
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"

# モジュールが配置されている Path
$RemovePath = Join-Path $ModulePath $ModuleName

# ディレクトリ削除
if( Test-Path $RemovePath ){
    Remove-Item $RemovePath -Force -Recurse
}


