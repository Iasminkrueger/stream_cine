# Rastreabilidade de Versões — Stream Cine

## 1. Objetivo

Registrar o caminho das versões do Stream Cine desde sua identificação até a publicação, incluindo commits, tags, Releases, Pull Requests, revisões humanas, integração contínua, entrega contínua, dependências, decisões de arquitetura e gestão de riscos.

Este documento também registra as configurações mantidas no repositório e diferencia os procedimentos já implementados daqueles cuja execução prática ainda precisa ser comprovada.

## 2. Versão de referência

| Item | Evidência |
|---|---|
| Release | [v1.4.0 — Baseline inicial](https://github.com/Iasminkrueger/stream_cine/releases/tag/v1.4.0) |
| Tag | `v1.4.0` |
| Commit | [`4ca2bef` — Adiciona pipeline de segurança](https://github.com/Iasminkrueger/stream_cine/commit/4ca2befe6b24613f5900000616121d7babf8111d) |
| Data do commit | 23/09/2026 |
| Publicação da Release | 16/11/2026 |
| Pacote | [stream_cine-v1.4.0.zip](https://github.com/Iasminkrueger/stream_cine/releases/download/v1.4.0/stream_cine-v1.4.0.zip) |
| Commit atual de referência da main | [`e6f9963`](https://github.com/Iasminkrueger/stream_cine/commit/e6f996303cdc55e57300494bd5848d77159b1772) |

A Release v1.4.0 fornece uma referência versionada para consulta e recuperação. O commit de origem da baseline aparece no histórico da branch principal; seu Pull Request de origem não foi identificado.

## 3. Relação com Pull Requests

| PR | Finalidade | Situação |
|---|---|---|
| [PR #9](https://github.com/Iasminkrueger/stream_cine/pull/9) | Integração contínua, testes, cobertura e validação de título | Aprovado e integrado em 11/11/2026 |
| [PR #10](https://github.com/Iasminkrueger/stream_cine/pull/10) | Entrega contínua, geração de pacote, staging, produção e rollback | Aprovado e integrado em 20/11/2026 |
| [PR #11](https://github.com/Iasminkrueger/stream_cine/pull/11) | Governança, Dependabot, CCM, ADRs e onboarding | Aprovado e integrado em 17/11/2026 |
| [PR #13](https://github.com/Iasminkrueger/stream_cine/pull/13) | Atualização de actions/checkout da versão 6 para 7 | Aprovado e integrado em 20/11/2026 |
| [PR #15](https://github.com/Iasminkrueger/stream_cine/pull/15) | Atualização de cached_network_image da versão 3.4.1 para 4.0.7 | Aprovado e integrado em 20/11/2026 |
| [PR #7](https://github.com/Iasminkrueger/stream_cine/pull/7) | Primeira proposta de atualização de cached_network_image | Fechado sem integração; substituído pelo PR #15 |

As revisões humanas dos PRs integrados acima foram registradas por `juliasgr`. Os PRs #9, #10, #11, #13 e #15 foram integrados à branch `main`.

O PR #7 foi fechado sem merge. Durante sua análise, foi identificada incompatibilidade entre a versão do Flutter utilizada inicialmente na CI (3.44.9) e uma dependência transitiva exigida por `cached_network_image 4.0.7`. A instalação falhava em `flutter pub get`, antes da execução dos testes. A CI foi atualizada para Flutter 3.50.0 no trabalho de entrega contínua, e a atualização da dependência foi posteriormente integrada pelo PR #15.

## 4. Revisão humana e integração contínua

### 4.1. Fluxo de branches e Pull Requests

A branch principal utilizada é `main`. As alterações são desenvolvidas em branches específicas e enviadas por Pull Requests, permitindo verificações automatizadas e revisão antes da integração.

O repositório contém o modelo `.github/pull_request_template.md`, que solicita:

- Contexto e motivo da alteração;
- Decisão tomada;
- Passos para testar;
- Checklist de escopo, testes, convenção de branches e commits;
- Verificação de segredos e dados sensíveis;
- Identificação de mudanças de alto risco e abertura do CCM quando necessário.

O modelo orienta o uso de títulos no padrão Conventional Commits e de branches com nomes descritivos. A branch `main` é protegida e as alterações são integradas por Pull Request.

### 4.2. Integração contínua — GitHub Actions

O workflow está em `.github/workflows/ci.yml` e é executado em pushes para `main` e em Pull Requests destinados à `main`.

Configurações e verificações implementadas:

- Execução em ambiente `ubuntu-latest`;
- Permissão de leitura do conteúdo do repositório;
- Checkout do código com `actions/checkout@v7`;
- Configuração do Flutter stable na versão 3.50.0;
- Instalação das dependências com `flutter pub get`;
- Análise estática com `flutter analyze --no-fatal-infos`;
- Testes automatizados com `flutter test --coverage`;
- Verificação de cobertura mínima de 60% das linhas;
- Compilação da versão Web com `flutter build web`.

O workflow possui também um job de revisão de dependências, executado em Pull Requests, com `actions/dependency-review-action@v4`. A configuração bloqueia vulnerabilidades classificadas como críticas (`fail-on-severity: critical`).

O job `ci-ok` consolida o resultado dos jobs obrigatórios e falha quando a qualidade não é aprovada ou quando a revisão de dependências apresenta falha. A revisão de dependências pode ser ignorada em eventos nos quais não se aplica, como determinados pushes para `main`.

### 4.3. Validação de títulos de Pull Requests

O workflow `.github/workflows/pr-titulo.yml` verifica títulos de Pull Requests direcionados à `main`, nos eventos de abertura, edição, atualização e reabertura.

É utilizado o padrão Conventional Commits, com tipos permitidos como:

- `feat`: funcionalidade;
- `fix`: correção;
- `docs`: documentação;
- `test`: testes;
- `ci`: integração contínua;
- `chore`: manutenção e dependências;
- `refactor`, `style`, `perf`, `build` e `revert`.

Títulos fora do padrão fazem a verificação falhar.

### 4.4. Dependabot e atualização de dependências

A configuração está em `.github/dependabot.yml`, com duas fontes de atualização:

- Ecossistema `pub`, para dependências Flutter/Dart do diretório raiz;
- Ecossistema `github-actions`, para dependências de GitHub Actions.

Ambas são verificadas semanalmente. As mensagens de commit propostas utilizam o prefixo `chore(deps)`.

Atualizações relevantes integradas:

- [PR #13](https://github.com/Iasminkrueger/stream_cine/pull/13): `actions/checkout` da versão 6 para 7;
- [PR #15](https://github.com/Iasminkrueger/stream_cine/pull/15): `cached_network_image` da versão 3.4.1 para 4.0.7.

### 4.5. Responsáveis e proteção de arquivos

O arquivo `.github/CODEOWNERS` define:

- `@Iasminkrueger` como responsável pelo repositório;
- `@Iasminkrueger` como responsável específico pelo diretório `.github/`.

O arquivo `.gitignore` exclui arquivos temporários e gerados, como caches do Dart/Flutter, diretório `build/`, cobertura em `coverage/`, arquivos de IDE, artefatos Android e arquivos de ambiente. A regra `.env.example` permite manter um exemplo de configuração sem versionar arquivos locais com variáveis de ambiente.

### 4.6. Análise estática, dependências e testes do aplicativo

O arquivo `analysis_options.yaml` utiliza as regras recomendadas por `package:flutter_lints/flutter.yaml`.

No código do aplicativo, a lógica de filtragem de filmes foi separada em `lib/filme_utils.dart`. Os testes de `test/filme_utils_test.dart` verificam três situações:

- Retorno de todos os filmes quando o termo de busca está vazio;
- Busca sem diferenciar letras maiúsculas e minúsculas;
- Retorno de lista vazia quando não existe correspondência.

A execução local registrada anteriormente de `flutter test --coverage` concluiu com três testes aprovados. A CI também verifica o limite mínimo de cobertura de 60%.

### 4.7. Configuração do projeto Flutter

As configurações principais estão em `pubspec.yaml`:

| Configuração | Valor |
|---|---|
| Nome do pacote | `stream_cine` |
| SDK Dart | `^3.12.2` |
| Dependência de imagens | `cached_network_image: ^4.0.7` |
| Ícones Cupertino | `cupertino_icons: ^2.0.0` |
| Testes Flutter | `flutter_test` |
| Regras de análise | `flutter_lints: ^6.0.0` |

O projeto utiliza Flutter e Dart, com compilação Web prevista na CI. O guia de onboarding recomenda Flutter 3.50.0 ou superior e execução pelo Google Chrome.

## 5. Issue de gestão de risco — CCM

A [Issue #12 — CCM: avaliar atualização major de cached_network_image](https://github.com/Iasminkrueger/stream_cine/issues/12) registra a avaliação de risco alto relacionada à atualização da dependência de imagens.

O formulário de mudança de alto risco está em `.github/ISSUE_TEMPLATE/mudanca-alto-risco.yml`. Ele solicita:

- Descrição da mudança;
- Tipo de risco;
- Impacto esperado;
- Plano de testes;
- Plano de rollback;
- Decisão do revisor, com justificativa.

A Issue #12 registra possíveis impactos no carregamento, decodificação e cache das imagens, especialmente na versão Web. Também contém um plano de testes e uma estratégia de recuperação baseada na Release/tag `v1.4.0`.

Durante a investigação, foi registrado que a falha inicial da CI do PR #7 ocorria na instalação das dependências, devido à incompatibilidade do SDK. Essa falha não chegou a demonstrar defeito nos testes do aplicativo.

Em 22/11/2026 foi adicionado um comentário à Issue informando que a atualização de `cached_network_image` 3.4.1 para 4.0.7 foi aprovada e integrada pelo PR #15, e que o PR #7 foi fechado sem integração.

**Situação atual:** a atualização da dependência e sua integração estão concluídas. A Issue permanece aberta. A decisão formal de risco do revisor e a validação prática do carregamento e cache das imagens no Chrome ainda precisam ser registradas. O texto original da Issue também precisa ser alinhado ao resultado do PR #15, pois ainda contém referências ao PR #7 como proposta pendente.

## 6. Aprovação de produção e rollback

### 6.1. Entrega contínua — CD

O workflow está em `.github/workflows/cd.yml`. Ele é acionado por pushes para `main`, exceto quando as alterações se limitam aos caminhos ignorados de documentação/arquivos Markdown, e também pode ser iniciado manualmente por `workflow_dispatch`.

O processo implementado possui as seguintes etapas:

1. **Preparar versão e pacote:** consulta o histórico de commits e calcula a próxima versão.
2. **Gerar pacote:** cria um arquivo ZIP do código-fonte e registra a versão em um arquivo `VERSAO`.
3. **Armazenar artefato:** disponibiliza o pacote e as notas de release como artefato, com retenção de 30 dias.
4. **Staging:** disponibiliza o pacote candidato e apresenta um resumo da execução.
5. **Produção:** quando há uma nova versão, utiliza o ambiente `production`, cria a tag e publica uma GitHub Release com o pacote ZIP e as notas.

O workflow declara os ambientes `staging` e `production`. A exigência efetiva de aprovação manual depende das regras de proteção configuradas nos ambientes do GitHub; essa configuração deve ser conferida nas configurações do repositório.

### 6.2. Versionamento semântico e notas de release

O cálculo da versão é realizado por `scripts/proxima-versao.mjs`, usando o histórico de Conventional Commits desde a última tag SemVer.

As regras implementadas são:

- `feat`: incremento MINOR;
- `fix` e `perf`: incremento PATCH;
- Alterações incompatíveis (`!` ou `BREAKING CHANGE`): incremento MAJOR;
- Documentação, manutenção, CI, testes e outros tipos sem mudança funcional: não geram nova versão.

O script também pode gerar notas de release agrupadas em funcionalidades, correções e outros registros.

### 6.3. Recuperação — Rollback

O workflow `.github/workflows/rollback.yml` pode ser iniciado manualmente e recebe a tag da versão de destino.

O procedimento:

- Valida se a tag segue o formato SemVer `vX.Y.Z`;
- Baixa o pacote ZIP anexado à GitHub Release indicada;
- Atualiza a Release escolhida como versão oficial (`Latest`);
- Registra no resumo da execução a versão selecionada e o usuário que solicitou o procedimento;
- Orienta a abertura de uma Issue e a correção da branch `main` por revert ou Pull Request.

### 6.4. Situação da entrega

Os workflows de CD e rollback estão versionados e foram integrados pelo PR #10. A existência dos arquivos comprova a implementação do processo, mas não comprova, por si só, uma publicação de produção aprovada nem a execução real de rollback.

**Situação:** implementação versionada; execução prática de produção e rollback ainda precisa ser comprovada e documentada.

## 7. Onboarding

O guia está em [docs/onboarding.md](onboarding.md) e descreve os requisitos e o fluxo para uma pessoa iniciar no projeto.

O documento contempla:

- Instalação de Git, Flutter 3.50.0 ou superior e Visual Studio Code;
- Extensões Flutter e Dart;
- Uso do Google Chrome;
- Verificação do ambiente com `flutter doctor`;
- Clonagem do repositório e instalação com `flutter pub get`;
- Execução com `flutter run -d chrome`;
- Análise com `flutter analyze --no-fatal-infos`;
- Testes com `flutter test --coverage`;
- Build Web com `flutter build web`;
- Criação de branches, Pull Requests, revisão e integração;
- Consulta às verificações de GitHub Actions e boas práticas de segurança.

O README.md também apresenta o projeto, funcionalidades, tecnologias, instalação, execução, análise do código e contribuição. O plano de Gerenciamento e Configuração do projeto está disponível em [docs/Gerenciamento_Configuracao_Stream_Cine.pdf](Gerenciamento_Configuracao_Stream_Cine.pdf).

**Situação:** documentação criada e versionada. A validação prática do guia por outra pessoa ainda precisa ser realizada e registrada.

## 8. Lacunas identificadas

| Pendência | Situação |
|---|---|
| Release/tag v1.4.0 e pacote de referência | Registrados |
| Integração contínua, análise, testes, cobertura e build Web | Configurados |
| Validação de títulos de Pull Requests | Configurada |
| Dependabot para pub e GitHub Actions | Configurado |
| CODEOWNERS, modelo de PR e formulário de alto risco | Configurados |
| PRs #9, #10, #11, #13 e #15 | Aprovados e integrados |
| PR #7 | Fechado sem integração; substituído pelo PR #15 |
| Atualização do texto original da Issue #12 | Pendente |
| Decisão formal de risco na Issue #12 | Pendente |
| Teste prático de imagens e cache no Chrome após a atualização | Pendente de registro |
| Conferência das regras de proteção dos ambientes staging e production | Pendente de comprovação |
| Execução de CD com aprovação e publicação de produção | Pendente de comprovação |
| Execução real e registro de rollback | Pendente de comprovação |
| Validação do onboarding por outra pessoa | Pendente |
| Identificação do PR de origem do commit da baseline 4ca2bef | Não identificado |

## 9. Conclusão

O Stream Cine possui uma estrutura de gerenciamento de configuração e entrega versionada no GitHub. O histórico contempla baseline, Releases, Pull Requests revisados, integração contínua, análise estática, testes, cobertura mínima, compilação Web, revisão de dependências, atualização automatizada, governança, documentação de arquitetura, entrega contínua e procedimento de rollback.

As configurações estão distribuídas entre os arquivos de workflow, modelos de contribuição, formulários de risco, arquivos do Flutter, scripts e documentos de apoio.

As pendências restantes estão relacionadas principalmente à comprovação de execuções práticas, à validação do onboarding e ao registro formal da decisão de risco da Issue #12. O documento deve ser atualizado quando essas evidências forem concluídas.
