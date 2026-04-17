# WebNavigator

Aplicativo iOS desenvolvido em **Swift + UIKit**, com arquitetura **MVVM + Coordinator**, que permite salvar e acessar rapidamente sites favoritos dentro do próprio app.

O projeto foi construído **100% programaticamente (sem Storyboard)** com foco em aprendizado de arquitetura, separação de responsabilidades e fluxo de navegação em UIKit.

---

## Funcionalidades

* Adicionar novos sites favoritos
* Validação básica de URL
* Lista de sites utilizando `UITableView`
* Abertura do site dentro do app com `WKWebView`
* Exclusão de sites com **Swipe to Delete**
* Persistência local com `UserDefaults`
* Limite de até **10 sites salvos**
* Alerta de "memória cheia" com opção de limpar a lista
* Reabertura do campo de inserção em caso de URL inválida

---

## Arquitetura

O projeto utiliza **MVVM + Coordinator + Service Layer**, garantindo separação clara de responsabilidades.

### View (ViewController)
* Responsável pela interface
* Recebe interações do usuário
* Exibe dados e estados

### ViewModel
* Contém regras de negócio
* Gerencia a lista de sites
* Valida URLs
* Aplica regra de limite (10 sites)

### Service (Storage)
* Responsável pela persistência local
* Utiliza `UserDefaults` para salvar e recuperar dados

### Coordinator
* Responsável pela navegação
* Controla fluxos do app (ex: abertura de páginas e alertas de decisão)

A comunicação entre ViewModel e ViewController ocorre via **Delegate Pattern**.

---

## Tecnologias utilizadas

* Swift
* UIKit
* WebKit
* UserDefaults
* AutoLayout programático
* UINavigationController

---

## Conceitos aplicados

* MVVM Architecture
* Coordinator Pattern
* Service Layer (Data Persistence)
* Delegate Pattern
* Programmatic UI
* Navigation Flow
* Data Persistence (UserDefaults)

---

## Objetivo do projeto

Este projeto foi desenvolvido como parte do estudo de **desenvolvimento iOS com UIKit**, com foco em:

* separação de responsabilidades
* organização escalável de código
* gerenciamento de fluxo com Coordinator
* persistência local de dados
