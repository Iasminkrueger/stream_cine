# Rastreabilidade de Versões — Stream Cine

## 1. Objetivo

Registrar o caminho de uma versão do Stream Cine desde sua identificação até sua publicação, incluindo tag, commit, Pull Request, revisão, integração contínua, Issue e aprovação de produção.

## 2. Versão de referência

| Item | Evidência |
|---|---|
| Release | [v1.4.0 — Baseline inicial](https://github.com/Iasminkrueger/stream_cine/releases/tag/v1.4.0) |
| Tag | v1.4.0 |
| Commit | 4ca2bef |
| Publicação | 16/11/2026 |
| Pacote | ZIP anexado à Release |

## 3. Relação com Pull Requests

| Elemento | Registro | Situação |
|---|---|---|
| Entrega contínua | [PR #10](https://github.com/Iasminkrueger/stream_cine/pull/10) | Aguardando aprovação e integração |
| Governança | [PR #11](https://github.com/Iasminkrueger/stream_cine/pull/11) | Aguardando aprovação e integração |
| PR que originou a Release v1.4.0 | Não identificado | Pendente de confirmação |

## 4. Revisão e integração contínua

Os Pull Requests do projeto utilizam GitHub Actions para executar verificações automáticas.

As verificações incluem análise do código, testes, cobertura e validação de dependências.

O PR #11 apresentou verificações automáticas aprovadas na consulta realizada em 17/11/2026.

A aprovação humana e a integração dos PRs ainda precisam ser confirmadas.

## 5. Issue relacionada

Foi criada a [Issue #12 — CCM: avaliar atualização major de cached_network_image](https://github.com/Iasminkrueger/stream_cine/issues/12).

A Issue registra a classificação de risco alto, os possíveis impactos, o plano de testes e o plano de rollback com referência à Release v1.4.0.

A decisão do revisor permanece pendente de avaliação humana.

## 6. Aprovação de produção

A publicação de produção deve utilizar o ambiente configurado no GitHub Actions, com aprovação antes da execução.

A evidência de aprovação de produção e a execução do workflow CD ainda precisam ser registradas.

## 7. Lacunas identificadas

- Identificar o Pull Request que originou a Release v1.4.0.
- Confirmar a revisão e aprovação associadas à versão de referência.
- Registrar o resultado da execução do CD.
- Registrar quem aprovou a publicação e quando.
- Registrar a decisão do revisor na Issue #12.
- Confirmar a execução do rollback.

## 8. Conclusão

A Release v1.4.0 possui tag, commit e pacote de referência identificados.

A rastreabilidade está parcialmente documentada. Os itens pendentes serão atualizados conforme as revisões, aprovações e execuções dos workflows forem concluídas.
