# WebNavigator

Aplicativo iOS desenvolvido em **Swift + UIKit**, com arquitetura **MVVM**, que permite salvar e acessar rapidamente sites favoritos dentro do próprio app.

O projeto foi construído **100% programaticamente (sem Storyboard)** com foco em aprendizado de arquitetura, organização de código e fluxo de navegação em UIKit.

---

## Funcionalidades

* Adicionar novos sites favoritos
* Validação básica de URL
* Lista de sites utilizando `UITableView`
* Abertura do site dentro do app com `WKWebView`
* Exclusão de sites com **Swipe to Delete**
* Reabertura do campo de inserção em caso de URL inválida

---

## Arquitetura

O projeto utiliza **MVVM (Model-View-ViewModel)** para separação de responsabilidades.

ViewController:

* Responsável pela interface
* Recebe interações do usuário
* Atualiza a UI

ViewModel:

* Contém regras de negócio
* Gerencia os dados da lista
* Valida URLs

Comunicação entre ViewModel e ViewController ocorre via **Delegate Pattern**.

---

## Estrutura do Projeto

```
Features
     SiteList
         View
             SiteListViewController.swift
         ViewModel
             SiteListViewModel.swift
 
     WebView
         View
             WebViewController.swift

App
     AppDelegate.swift
     SceneDelegate.swift
```

Organização baseada em **features**, facilitando escalabilidade do projeto.

---

## Tecnologias utilizadas

* Swift
* UIKit
* WebKit
* AutoLayout programático
* UINavigationController
* Delegate Pattern

---

## Conceitos aplicados

* MVVM Architecture
* Dependency Injection
* Delegate Pattern
* UIKit Lifecycle
* Programmatic UI
* Navigation Controller Flow

---

## Objetivo do projeto

Este projeto foi desenvolvido como parte do estudo de **desenvolvimento iOS com UIKit**, com foco em:

* entendimento do ciclo de vida do app
* construção de interfaces programaticamente
* organização de código para projetos escaláveis

---
