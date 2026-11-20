
# Rastreabilidade de Versões — Stream Cine

## 1. Objetivo

Registrar o caminho de uma versão do Stream Cine desde sua identificação até sua publicação, incluindo Release, tag, commit, Pull Request, revisão humana, integração contínua, Issue e aprovação de produção.

## 2. Versão de referência

| Item | Evidência |
|---|---|
| Release | [v1.4.0 — Baseline inicial](https://github.com/Iasminkrueger/stream_cine/releases/tag/v1.4.0) |
| Tag | v1.4.0 |
| Commit | [4ca2bef — Adiciona pipeline de seguranca](https://github.com/Iasminkrueger/stream_cine/commit/4ca2befe6b24613f5900000616121d7babf8111d) |
| Data do commit | 23/09/2026 |
| Data de publicação da Release | 16/11/2026 |
| Pacote | [stream_cine-v1.4.0.zip](https://github.com/Iasminkrueger/stream_cine/releases/download/v1.4.0/stream_cine-v1.4.0.zip) |
| PR de origem do commit | Não identificado; o commit aparece diretamente no histórico da main. |

## 3. Relação com Pull Requests

| PR | Finalidade | Situação |
|---|---|---|
| [PR #9](https://github.com/Iasminkrueger/stream_cine/pull/9) | Configuração de integração contínua | Aprovado por juliasgr e integrado em 11/11/2026 |
| [PR #10](https://github.com/Iasminkrueger/stream_cine/pull/10) | Entrega contínua e rollback | Checks aprovados; aguardando revisão e integração |
| [PR #11](https://github.com/Iasminkrueger/stream_cine/pull/11) | Governança, Dependabot, CCM, ADRs e onboarding | Checks aprovados; aguardando revisão e integração |
| [PR #7](https://github.com/Iasminkrueger/stream_cine/pull/7) | Atualização de cached_network_image para 4.0.7 | Pendente de correção da CI e revisão humana |

## 4. Revisão humana e integração contínua

### PR #9 — Integração contínua

- Revisora: juliasgr.
- Decisão: APPROVED.
- Comentário da revisão: "feito :)"
- Integração: 11/11/2026.
- Commit de integração: fe7e7f0.

### Execução da CI da versão de referência

A execução do workflow Segurança e qualidade no commit 4ca2bef terminou com sucesso em 23/09/2026.

[Consultar execução no GitHub Actions](https://github.com/Iasminkrueger/stream_cine/actions/runs/35890347069)

A verificação de segurança foi aprovada. A verificação de dependências foi ignorada nessa execução porque o evento foi um push na main.

### PR #10 — Entrega contínua

Os quatro checks do commit consultado estão aprovados:

- ci-ok;
- qualidade;
- titulo-pr;
- dependencias.

A aprovação humana e a integração ainda estão pendentes.

### PR #11 — Governança

Os quatro checks do commit consultado estão aprovados:

- ci-ok;
- qualidade;
- titulo-pr;
- dependencias.

A revisão de juliasgr foi solicitada e ainda está pendente.

### PR #7 — Dependabot

A atualização proposta é da versão 3.4.1 para 4.0.7.

A investigação identificou incompatibilidade entre a versão Flutter/Dart utilizada pela CI da main e uma dependência transitiva da atualização.

A execução falhou durante flutter pub get, antes da realização dos testes do aplicativo.

O PR #10 contém a atualização da CI para Flutter 3.50.0. Após sua integração, será necessário atualizar a branch do PR #7 e executar novamente as verificações.

O PR #7 não deve ser integrado antes da aprovação da CI e da revisão humana.

## 5. Issue de gestão de risco — CCM

Foi criada a [Issue #12 — CCM: avaliar atualização major de cached_network_image](https://github.com/Iasminkrueger/stream_cine/issues/12).

A Issue registra:

- Classificação de risco alto;
- Possíveis impactos na exibição e no cache das imagens;
- Plano de testes;
- Plano de rollback com referência à Release/tag v1.4.0.

A decisão do revisor permanece pendente. A mudança não deve ser integrada enquanto não houver decisão humana registrada.

## 6. Aprovação de produção e rollback

A estratégia de entrega contínua está documentada no PR #10, incluindo workflow de CD e workflow de rollback.

A execução de produção com aprovação pelo ambiente do GitHub ainda não foi comprovada.

Também não há evidência de uma execução real de rollback.

Esses registros deverão ser adicionados após a integração dos workflows e a realização dos procedimentos.

## 7. Onboarding

O guia de onboarding está em:

[docs/onboarding.md](onboarding.md)

O documento apresenta instalação, execução, testes, criação de branches, Pull Requests e pipeline de integração contínua.

A validação prática por outra pessoa ainda está pendente. Será necessário que um colega siga o guia e registre eventuais correções por meio de um Pull Request.

## 8. Lacunas identificadas

| Pendência | Situação |
|---|---|
| Identificar PR de origem do commit 4ca2bef | Não identificado |
| Registrar aprovação do PR #9 | Concluído |
| Aprovação e integração do PR #10 | Pendente |
| Aprovação e integração do PR #11 | Pendente |
| Corrigir e validar CI do PR #7 | Pendente |
| Decisão humana da Issue #12 | Pendente |
| Validação do onboarding por colega | Pendente |
| Execução de CD com aprovação de produção | Pendente |
| Execução e comprovação de rollback | Pendente |

## 9. Conclusão

A Release v1.4.0 possui tag, commit, pacote ZIP e execução de segurança identificados.

O PR #9 comprova uma revisão humana e integração da configuração de CI.

Os PRs #10 e #11 possuem verificações automáticas aprovadas, mas ainda aguardam revisão e integração.

A atualização de dependência do PR #7 permanece bloqueada por incompatibilidade do SDK na CI atual.

A rastreabilidade está documentada com evidências disponíveis e pendências explicitamente identificadas. Os registros deverão ser atualizados conforme novas aprovações e execuções forem realizadas.
