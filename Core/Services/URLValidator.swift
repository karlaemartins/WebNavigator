//
//  URLValidator.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 05/05/26.
//

import Foundation


final class URLValidator: URLValidatorProtocol {
    
    func validate(_ text: String) -> URL? {
        
        var formattedText = text
        
        if !formattedText.hasPrefix("http") {
            formattedText = "https://" + formattedText
        }
        
        guard let url = URL(string: formattedText),
              let host = url.host,
              host.contains(".") else {
            return nil
        }
        return url
    }
}
