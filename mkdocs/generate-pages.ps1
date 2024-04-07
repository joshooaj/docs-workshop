'about', 'contact' | ForEach-Object {
    "# $($_[0].ToString().ToUpper() + $_.Substring(1))" | Set-Content -Path (New-Item "./sandbox/docs/$_.md" -Force)
}

1..5 | ForEach-Object {
   "# Step $_`n`n" | Set-Content -Path (New-Item "./sandbox/docs/getting-started/step-0$_.md" -Force)
}
