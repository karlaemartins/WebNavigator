//
//  SiteListViewModel.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 19/02/26.
//

import UIKit

protocol SiteListViewModelDelegate: AnyObject {
    func didUpdateSites()
}

class SiteListViewModel {
    
    weak var delegate: SiteListViewModelDelegate?

    private(set) var sites: [URL] = []
    
    func addSite(from text: String) {
        guard let url = URL(string: text) else { return }
        sites.append(url)
        delegate?.didUpdateSites()
        

    }
}
