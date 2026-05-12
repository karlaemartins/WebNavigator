//
//  MockURLValidator.swift
//  WebNavigatorTests
//
//  Created by Karla E. Martins Fernandes on 12/05/26.
//

import Foundation
@testable import WebNavigator

final class MockURLValidator: URLValidatorProtocol {
    
    var validateResult: URL?
    
    func validate(_ text: String) -> URL? {
        return validateResult
    }

}
