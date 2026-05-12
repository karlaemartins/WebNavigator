//
//  MockSiteListViewModelDelegate.swift
//  WebNavigatorTests
//
//  Created by Karla E. Martins Fernandes on 12/05/26.
//

import Foundation
@testable import WebNavigator

final class MockSiteListViewModelDelegate: SiteListViewModelDelegate {
    
    var didTryToAddDuplicateCalled = false
    var didReachLimitCalled = false
    var didReceiveInvalidURLCalled = false
    var didPartiallyRecoverSitesCalled = false
    
    func didTryToAddDuplicate() {
        didTryToAddDuplicateCalled = true
    }
    
    func didUpdateSites() {
        
    }

    func didReceiveInvalidURL() {
        didReceiveInvalidURLCalled = true
        
    }

    func didReachLimit() {
        didReachLimitCalled = true
    }

    func didPartiallyRecoverSites() {
        didPartiallyRecoverSitesCalled = true
        
    }

}
