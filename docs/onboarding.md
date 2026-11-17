
# Guia de Onboarding — Stream Cine

## 1. Sobre o projeto

O Stream Cine é um aplicativo desenvolvido em Flutter para exibição e pesquisa de filmes. O projeto utiliza o pacote `cached_network_image` para carregar imagens pela internet.

## 2. Pré-requisitos

Antes de começar, instale:

- Git
- Flutter 3.50.0 ou superior
- Visual Studio Code
- Extensões Flutter e Dart para o VS Code
- Google Chrome

Confira a instalação do Flutter:

```bash
flutter doctor
```

## 3. Obter o projeto

Clone o repositório:

```bash
git clone https://github.com/Iasminkrueger/stream_cine.git
```

Entre na pasta:

```bash
cd stream_cine
```

## 4. Instalar as dependências

Execute:

```bash
flutter pub get
```

## 5. Executar o aplicativo

Para executar no Google Chrome:

```bash
flutter run -d chrome
```

## 6. Verificar o código e executar os testes

Para analisar o código:

```bash
flutter analyze --no-fatal-infos
```

Para executar os testes com cobertura:

```bash
flutter test --coverage
```

Para gerar a versão Web:

```bash
flutter build web
```

## 7. Fluxo de desenvolvimento

1. Atualize a branch principal antes de começar.
2. Crie uma branch para sua tarefa.
3. Faça as alterações necessárias.
4. Execute a análise e os testes.
5. Envie a branch para o GitHub.
6. Abra um Pull Request para a branch `main`.
7. Aguarde a revisão e aprovação de outra pessoa.
8. Confira se os testes automáticos passaram.
9. Após a aprovação, o Pull Request poderá ser integrado.

Exemplo de criação de branch:

```bash
git switch main
git pull origin main
git switch -c feat/nova-funcionalidade
```

## 8. Integração contínua e entrega contínua

O projeto utiliza GitHub Actions para executar verificações automáticas nos Pull Requests.

O processo inclui:

- Análise estática do código.
- Execução dos testes.
- Verificação da cobertura de testes.
- Verificação de dependências.
- Geração do pacote de entrega.
- Aprovação antes da publicação em produção.

Consulte a aba Actions do repositório para acompanhar as execuções.

## 9. Boas práticas

- Não faça alterações diretamente na branch `main`.
- Utilize nomes claros para branches e commits.
- Execute os testes antes de abrir um Pull Request.
- Não envie senhas, tokens ou dados pessoais ao repositório.
- Descreva claramente o objetivo das alterações.
