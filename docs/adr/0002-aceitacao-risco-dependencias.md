
# ADR 0002 — Aceitação de risco das dependências

- **Status:** Accepted
- **Data:** 16/11/2026

## Contexto

O Stream Cine utiliza dependências externas para funcionar. Essas dependências podem apresentar vulnerabilidades de segurança, por isso é necessário definir critérios para avaliar e tratar os riscos.

## Decisão

Manter o bloqueio automático da integração contínua para vulnerabilidades classificadas como críticas.

Alertas de severidade alta devem ser analisados individualmente, considerando se afetam dependências utilizadas em produção ou apenas ferramentas de desenvolvimento.

A aceitação de qualquer risco deve ser documentada em uma Issue, com justificativa, responsável e prazo para revisão. Vulnerabilidades críticas não devem ser aceitas sem correção ou avaliação específica.

## Situação verificada em 17/11/2026

Foi realizada uma consulta à seção Dependabot Alerts do repositório Stream Cine.

O GitHub apresentou os seguintes resultados:

- Alertas abertos: 0.
- Alertas fechados: 0.
- Arquivos de dependências verificados pelo GitHub no dia anterior à consulta.

No momento da verificação, não foram identificados alertas abertos pelo Dependabot. Essa situação deverá ser reavaliada periodicamente, pois novos alertas podem surgir com atualizações das dependências.

## Alternativas consideradas

- Bloquear a integração contínua para qualquer vulnerabilidade.
- Bloquear somente vulnerabilidades críticas e analisar as altas individualmente.
- Não realizar bloqueios automáticos.

## Consequências

- O pipeline continua bloqueando vulnerabilidades críticas.
- Vulnerabilidades altas precisam de análise e justificativa documentadas.
- A equipe consegue acompanhar os riscos aceitos e seus prazos de revisão.
- A configuração deve ser reavaliada quando surgirem novas vulnerabilidades ou mudanças nas dependências.
