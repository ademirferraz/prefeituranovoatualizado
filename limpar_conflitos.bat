@echo off
echo ========================================
echo 🧹 Limpando marcadores de conflito Git
echo ========================================

REM Executa PowerShell para limpar os marcadores em todos os arquivos
powershell -Command "Get-ChildItem -Recurse -Include *.dart,*.yaml,*.md | ForEach-Object {
  (Get-Content $_.FullName) | Where-Object {
    $_ -notmatch '^(<<<<<<<|=======|>>>>>>>).*'
  } | Set-Content $_.FullName
}"

echo ✅ Marcadores removidos com sucesso!

REM Etapa 2: Adicionar todos os arquivos modificados
git add .

REM Etapa 3: Commit das resoluções
git commit -m "Conflitos resolvidos automaticamente com limpeza de marcadores"

REM Etapa 4: Push para o GitHub
git push -u origin main

echo 🚀 Tudo pronto! Repositório sincronizado com sucesso.
pause
