$files = Get-ChildItem -Recurse -Include *.dart, *.yaml, *.md
foreach ($file in $files) {
    $cleaned = Get-Content $file.FullName | Where-Object { $_ -notmatch '^(<<<<<<<|=======|>>>>>>>).*' }
    Set-Content $file.FullName -Value $cleaned
}

