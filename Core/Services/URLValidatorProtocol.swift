//
//  URLValidatorProtocol.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 05/05/26.
//

import Foundation


protocol URLValidatorProtocol {
    func validate(_ text: String) -> URL?
}
