# WebNavigator

Aplicativo iOS desenvolvido em **Swift + UIKit**, com arquitetura **MVVM + Coordinator + Dependency Injection**, que permite salvar e acessar rapidamente sites favoritos dentro do próprio app.

O projeto foi construído **100% programaticamente (sem Storyboard)** com foco em aprendizado de arquitetura, separação de responsabilidades e fluxo de navegação em UIKit.

---

## Funcionalidades

- Adicionar novos sites favoritos
- Validação básica de URL
- Lista de sites utilizando `UITableView`
- Abertura do site dentro do app com `WKWebView`
- Exclusão de sites com **Swipe to Delete**
- Persistência local com `UserDefaults`
- Limite de até **10 sites salvos**
- Alerta de "memória cheia" com opção de limpar a lista
- Reabertura do campo de inserção em caso de URL inválida

---

## Arquitetura

O projeto utiliza **MVVM + Coordinator + Service Layer + Dependency Injection**, garantindo separação clara de responsabilidades e baixo acoplamento.

### View (ViewController)
- Responsável pela interface
- Recebe interações do usuário
- Exibe dados e estados

### ViewModel
- Contém regras de negócio
- Gerencia a lista de sites
- Valida URLs
- Aplica regra de limite (10 sites)
- Não cria dependências, apenas as recebe (Dependency Injection)

### Service (Storage)
- Responsável pela persistência local
- Utiliza `UserDefaults` para salvar e recuperar dados
- Pode ser facilmente substituído por API ou banco de dados

### Coordinator
- Responsável pela navegação
- Controla fluxos do app (ex: abertura de páginas e alertas de decisão)
- Centraliza a criação e injeção de dependências

---

## Dependency Injection

O projeto utiliza **Dependency Injection** para reduzir acoplamento e facilitar manutenção.

- O `ViewModel` recebe o `Service` via `init`
- A `ViewController` recebe o `ViewModel`
- O `Coordinator` é responsável por criar e injetar todas as dependências

Essa abordagem permite:

- Facilidade para testes
- Troca de implementação (ex: UserDefaults → API)
- Melhor organização do código

---

## Tecnologias utilizadas

- Swift
- UIKit
- WebKit
- UserDefaults
- AutoLayout programático
- UINavigationController

---

## Objetivo do projeto

Este projeto foi desenvolvido como parte do estudo de **desenvolvimento iOS com UIKit**, com foco em:

- separação de responsabilidades
- organização escalável de código
- gerenciamento de fluxo com Coordinator
- persistência local de dados
- aplicação de Dependency Injection
