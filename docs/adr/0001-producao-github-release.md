
# ADR 0001 — Publicação de versões por GitHub Release

- **Status:** Accepted
- **Data:** 16/11/2026

## Contexto

O Stream Cine precisa de um processo organizado para gerar, identificar e disponibilizar versões do aplicativo. Também é importante manter um histórico das versões publicadas e permitir a recuperação de uma versão anterior.

## Decisão

Adotar o GitHub Release como mecanismo de publicação das versões de produção. Cada versão deve possuir uma tag seguindo o padrão SemVer e um pacote ZIP correspondente anexado à Release.

A publicação deve passar pela etapa de aprovação configurada no ambiente de produção do GitHub Actions.

## Alternativas consideradas

- Disponibilizar os arquivos manualmente, sem controle de versões.
- Utilizar outro serviço externo de hospedagem.
- Utilizar GitHub Releases com tags e pacotes versionados.

## Consequências

- As versões ficam organizadas e identificadas por tags.
- O histórico de publicação pode ser consultado no GitHub.
- O pacote de cada versão pode ser recuperado.
- A publicação depende da aprovação configurada no ambiente de produção.
- O rollback pode utilizar uma versão anterior publicada.
