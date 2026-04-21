//
//  StorageServiceProtocol.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 21/04/26.
//

import Foundation

protocol StorageServiceProtocol {
    func saveSites(_ sites: [Site])
    func loadSites() -> [Site]
}
