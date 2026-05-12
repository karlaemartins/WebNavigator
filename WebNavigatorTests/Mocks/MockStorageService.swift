//
//  MockStorageService.swift
//  WebNavigatorTests
//
//  Created by Karla E. Martins Fernandes on 12/05/26.
//

import Foundation
@testable import WebNavigator



final class MockStorageService: StorageServiceProtocol {

    var sites: [Site] = []
    var deletedSites: [Site] = []

    func saveSites(_ sites: [Site]) {
        self.sites = sites
    }

    func loadSites() -> [Site] {
        return sites
    }
    
    func saveLastDeletedSites(_ sites: [Site]) {
        self.deletedSites = sites
    }
    
    func loadLastDeletedSites() -> [Site] {
        return deletedSites
    }
}
