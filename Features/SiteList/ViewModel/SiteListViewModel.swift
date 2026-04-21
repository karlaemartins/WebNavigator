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
    func didReachLimit()
}

class SiteListViewModel {
    
    weak var delegate: SiteListViewModelDelegate?
    private(set) var sites: [Site] = []
    private let storage: StorageServiceProtocol
    
    init(storage: StorageServiceProtocol) {
        self.storage = storage
        loadSites()
    }
    
    private func loadSites() {
        sites = storage.loadSites()
        
    }
    
    func displayName(for index: Int) -> String {
        let urlString = sites[index].url
        
        if let url = URL(string: urlString) {
            return url.host ?? urlString
        }
        
        return urlString
    }
    
    func addSite(from text: String) {
        
        if sites.count >= 10 {
            delegate?.didReachLimit()
            return
        }
        
        if !text.contains(".") {
            delegate?.didReceiveInvalidURL()
            return
        }
        
        var formattedText = text
        
        if !formattedText.hasPrefix("http") {
            formattedText = "https://" + formattedText
        }
        
        guard URL(string: formattedText) != nil else {
            delegate?.didReceiveInvalidURL()
            return
        }

        let site = Site(url: formattedText)
        sites.append(site)
        storage.saveSites(sites)
        delegate?.didUpdateSites()
    }
    
    func removeSite(at index: Int) {
        sites.remove(at: index)
        storage.saveSites(sites)
        delegate?.didUpdateSites()
    }
    
    func clearSites() {
        sites.removeAll()
        storage.saveSites(sites)
        delegate?.didUpdateSites()
    }
        

    }

