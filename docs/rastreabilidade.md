# Rastreabilidade de Versões — Stream Cine

## 1. Objetivo

Documentar as versões, alterações, aprovações e entregas do projeto Stream Cine, mantendo o histórico de decisões e evidências no GitHub.

## 2. Versão de referência

| Item | Registro |
|---|---|
| Release | [v1.4.0](https://github.com/Iasminkrueger/stream_cine/releases/tag/v1.4.0) |
| Tag | `v1.4.0` |
| Commit | [`4ca2bef`](https://github.com/Iasminkrueger/stream_cine/commit/4ca2befe6b24613f5900000616121d7babf8111d) |
| Data do commit | 23/09/2026 |
| Publicação | 16/11/2026 |
| Pacote | [Download ZIP](https://github.com/Iasminkrueger/stream_cine/releases/download/v1.4.0/stream_cine-v1.4.0.zip) |

## 3. Pull Requests

| PR | Alteração | Situação |
|---|---|---|
| [#9](https://github.com/Iasminkrueger/stream_cine/pull/9) | Integração contínua | Aprovado e integrado |
| [#10](https://github.com/Iasminkrueger/stream_cine/pull/10) | Entrega contínua e rollback | Aprovado e integrado |
| [#11](https://github.com/Iasminkrueger/stream_cine/pull/11) | Governança e documentação | Aprovado e integrado |
| [#13](https://github.com/Iasminkrueger/stream_cine/pull/13) | Atualização do actions/checkout | Integrado |
| [#15](https://github.com/Iasminkrueger/stream_cine/pull/15) | Atualização do cached_network_image para 4.0.7 | Aprovado e integrado |
| [#7](https://github.com/Iasminkrueger/stream_cine/pull/7) | Atualização de dependência | Fechado sem integração |

As revisões humanas dos PRs #9, #10, #11 e #15 foram realizadas por `juliasgr`.

## 4. Dependências e qualidade

As dependências são acompanhadas pelo Dependabot, com atualizações propostas por Pull Requests.

Versões atuais relevantes:

- `cached_network_image`: `4.0.7`;
- `actions/checkout`: `7`.

A integração das alterações depende das verificações automatizadas e da revisão necessária.

## 5. Gestão de riscos

A [Issue #12 — CCM](https://github.com/Iasminkrueger/stream_cine/issues/12) registra a avaliação de risco alto da atualização do `cached_network_image`.

O registro contém impactos possíveis, plano de testes e estratégia de rollback com referência à Release `v1.4.0`.

**Situação:** Issue aberta, aguardando atualização e registro formal da decisão de risco.

## 6. Entrega e recuperação

Os workflows de integração contínua, entrega contínua e rollback estão versionados no repositório:

- `.github/workflows/ci.yml`
- `.github/workflows/cd.yml`
- `.github/workflows/rollback.yml`

A execução de produção com aprovação e a realização de um rollback ainda precisam de comprovação.

## 7. Onboarding

O procedimento de instalação, execução e contribuição está documentado em [docs/onboarding.md](onboarding.md).

A validação prática por outro colega ainda está pendente.

## 8. Pendências

| Atividade | Situação |
|---|---|
| Atualizar a Issue #12 e registrar decisão de risco | Pendente |
| Validar o onboarding com outro colega | Pendente |
| Comprovar entrega em produção com aprovação | Pendente |
| Executar e documentar um rollback | Pendente |

## 9. Conclusão

O projeto possui histórico de versões, Pull Requests revisados, integração contínua, entrega contínua e gerenciamento de dependências documentados.

As pendências restantes estão identificadas e poderão ser atualizadas conforme novas evidências forem registradas no GitHub.