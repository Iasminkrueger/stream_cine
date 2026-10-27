# Stream Cine

Aplicativo de catálogo de filmes desenvolvido em Flutter e Dart como projeto acadêmico, com foco na organização do código, na experiência do usuário e nas boas práticas de desenvolvimento de software.

## Sobre o projeto

O Stream Cine permite visualizar um catálogo de filmes, consultar informações básicas e pesquisar títulos. Também oferece a possibilidade de favoritar filmes, facilitando a organização dos conteúdos de interesse.

## Funcionalidades

- Exibição de filmes com cartazes, títulos, gêneros e avaliações.
- Pesquisa de filmes pelo nome.
- Adição e remoção de filmes dos favoritos.
- Exibição de imagens com tratamento para carregamento e falhas.
- Feedback visual ao adicionar ou remover um favorito.

## Tecnologias utilizadas

- **Flutter:** desenvolvimento da interface do aplicativo.
- **Dart:** linguagem de programação.
- **cached_network_image:** carregamento e exibição de imagens pela internet.
- **Git e GitHub:** versionamento e gerenciamento do código-fonte.
- **GitHub Actions:** execução automatizada de verificações de qualidade e segurança.

## Como executar o projeto

### Pré-requisitos

- Flutter instalado e configurado.
- Dart, disponibilizado com o Flutter.
- Editor de código, como Visual Studio Code.
- Emulador Android ou dispositivo compatível, se desejar executar o aplicativo nele.

### Instalação

1. Clone o repositório:

```bash
git clone https://github.com/Iasminkrueger/stream_cine.git
```

2. Entre na pasta do projeto:

```bash
cd stream_cine
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o aplicativo:

```bash
flutter run
```

## Verificação do código

Para verificar possíveis problemas de análise estática, execute:

```bash
flutter analyze
```

O projeto também possui uma configuração de integração contínua com GitHub Actions para automatizar verificações do código.

## Gerenciamento de configuração

O código-fonte é versionado com Git e hospedado no GitHub. O projeto utiliza arquivos de configuração para organizar as dependências, manter arquivos desnecessários fora do repositório e automatizar verificações de qualidade e segurança.

O Plano de Gerenciamento de Configuração (Enfoque DevOps) está disponível em [docs/Gerenciamento_Configuracao_Stream_Cine.pdf](docs/Gerenciamento_Configuracao_Stream_Cine.pdf).

## Contribuição

Alterações no projeto podem ser organizadas por meio de branches e Pull Requests, permitindo revisar as modificações antes de incorporá-las à branch principal.

## Objetivo acadêmico

Praticar o desenvolvimento de aplicativos com Flutter, o gerenciamento de dependências, o versionamento de código e a aplicação de práticas de qualidade e segurança no desenvolvimento de software.
