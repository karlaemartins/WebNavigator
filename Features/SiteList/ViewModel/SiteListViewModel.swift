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
    func didTryToAddDuplicate()
    func didPartiallyRecoverSites()
}

class SiteListViewModel {
    
    weak var delegate: SiteListViewModelDelegate?
    private(set) var sites: [Site] = []
    private let storage: StorageServiceProtocol
    private let validator: URLValidatorProtocol
    
    init(storage: StorageServiceProtocol, validator: URLValidatorProtocol) {
        self.storage = storage
        self.validator = validator
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
        
        
        guard let url = validator.validate(text) else {
            delegate?.didReceiveInvalidURL()
            return
        }
        
        if sites.contains(where: { $0.url == url.absoluteString }) {
            delegate?.didTryToAddDuplicate()
            return
        }
        
    
        let site = Site(url: url.absoluteString)
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
        
        if !sites.isEmpty {
            storage.saveLastDeletedSites(sites)
        }
        
        sites.removeAll()
        storage.saveSites(sites)
        delegate?.didUpdateSites()
    }
    
    func recoverSites() {
        
        let deletedSites = storage.loadLastDeletedSites()
        let newSites = deletedSites.filter { deletedSite in !sites.contains(where: { $0.url == deletedSite.url })
        }
        let availableSlots = 10 - sites.count
        let recoveredSites = Array(newSites.prefix(availableSlots))
        
        sites.append(contentsOf: recoveredSites)
        
        if newSites.count > availableSlots {
                delegate?.didPartiallyRecoverSites()
            }
        
        storage.saveSites(sites)
        delegate?.didUpdateSites()
        }
    
   
    }
        

