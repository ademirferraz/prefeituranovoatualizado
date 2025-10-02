@echo off
echo ========================================
echo  Resolucao automatica de conflitos Git
echo ========================================

REM Etapa 1: Remover marcadores de conflito e manter versão local
REM (Você já deve ter editado os arquivos manualmente antes de rodar isso)

REM Etapa 2: Adicionar todos os arquivos modificados
git add .

REM Etapa 3: Commit das resoluções
git commit -m "Conflitos resolvidos automaticamente com versão local"

REM Etapa 4: Push para o GitHub
git push -u origin main

echo  Conflitos resolvidos e enviados com sucesso!
pause
