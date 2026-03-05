//
//  SiteListViewModel.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 19/02/26.
//

import UIKit

protocol SiteListViewModelDelegate: AnyObject {
    func didUpdateSites()
    func didReceiveInvalidURL()
}

class SiteListViewModel {
    
    weak var delegate: SiteListViewModelDelegate?

    private(set) var sites: [URL] = []
    
    func displayName(for index: Int) -> String {
        return sites[index].host ?? sites[index].absoluteString
    }
    
    func addSite(from text: String) {
        
        if !text.contains(".") {
            delegate?.didReceiveInvalidURL()
            return
        }
        
        var formattedText = text
        
        if !formattedText.hasPrefix("http") {
            formattedText = "https://" + formattedText
        }
        
        guard let url = URL(string: formattedText) else {
            delegate?.didReceiveInvalidURL()
            return
        }

        sites.append(url)
        delegate?.didUpdateSites()
    }
        

    }

