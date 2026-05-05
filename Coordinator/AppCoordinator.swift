//
//  AppCoordinator.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 15/04/26.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func openSite(with url: URL)
    func showLimitAlert(onClear: @escaping () -> Void)
    func showInvalidURLAlert()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let storage = FavoritesStorageService()
        let validator = URLValidator()
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        let viewController = SiteListViewController(viewModel: viewModel)
        viewController.coordinator = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        
        return navigationController
    }
    
    func openSite(with url: URL) {
        let webVC = WebViewController(url: url)
        navigationController?.pushViewController(webVC, animated: true)
    }
    
    func showLimitAlert(onClear: @escaping () -> Void) {
        let alert = UIAlertController(
            title: "Memória cheia",
            message: "Você atingiu o limite de 10 sites. Deseja limpar a lista?",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        
        let clearAction = UIAlertAction(title: "Limpar", style: .destructive) { _ in
            onClear()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(clearAction)
        
        navigationController?.present(alert, animated: true)
    }
    
    func showInvalidURLAlert() {
        
        let alert = UIAlertController(
            title: "URL inválida",
            message: "Digite um endereço válido.",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
        })

        navigationController?.present(alert, animated: true)
    }
    
}
