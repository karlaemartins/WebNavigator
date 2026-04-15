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
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let viewController = SiteListViewController()
        viewController.coordinator = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        
        return navigationController
    }
    
    func openSite(with url: URL) {
        let webVC = WebViewController(url: url)
        navigationController?.pushViewController(webVC, animated: true)
    }
}
