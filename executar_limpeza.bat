@echo off
echo ========================================
echo 🧹 Limpando marcadores de conflito Git
echo ========================================

powershell -ExecutionPolicy Bypass -File "%~dp0limpar_conflitos.ps1"

git add .
git commit -m "Conflitos resolvidos automaticamente com limpeza de marcadores"
git push -u origin main

echo 🚀 Tudo pronto! Repositório sincronizado com sucesso.
pause
