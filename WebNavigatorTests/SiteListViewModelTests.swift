//
//  SiteListViewModelTests.swift
//  WebNavigatorTests
//
//  Created by Karla E. Martins Fernandes on 12/05/26.
//

import XCTest
@testable import WebNavigator

final class SiteListViewModelTests: XCTestCase {
    
    func testAddSiteAddsNewSiteWhenURLIsValid() {
        
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        
        validator.validateResult = URL(string: "https://google.com")
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        //Act:
        viewModel.addSite(from: "google.com")
        
        //Assert:
        XCTAssertEqual(storage.sites.count, 1)
        
    }
    
    func testAddSiteDoesNotSaveSiteWhenURLIsInvalid() {
        
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        
        validator.validateResult = nil
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        //Act:
        viewModel.addSite(from: "")
        
        //Assert:
        XCTAssertEqual(storage.sites.count, 0)
        
    }
    
    func testAddSiteDoesNotAddDuplicateSite() {
        
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        
        validator.validateResult = URL(string: "https://google.com")
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        //Act:
        viewModel.addSite(from: "google.com")
        viewModel.addSite(from: "google.com")
        
        //Assert:
        XCTAssertEqual(storage.sites.count, 1)
    }
    
    func testAddSiteCallsDelegateWhenSiteIsDuplicate() {
        
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        let delegate = MockSiteListViewModelDelegate()
        
        validator.validateResult = URL(string: "https://google.com")
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        viewModel.delegate = delegate
        
        //Act:
        viewModel.addSite(from: "google.com")
        viewModel.addSite(from: "google.com")
        
        //Assert:
        XCTAssertTrue(delegate.didTryToAddDuplicateCalled)

    }
    
    func testAddSiteCallsDelegateWhenLimitIsReached() {
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        let delegate = MockSiteListViewModelDelegate()
        
        
        storage.sites = Array(repeating: Site(url: "https://google.com"),count: 10)
        
        validator.validateResult = URL(string: "https://google.com")
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        viewModel.delegate = delegate
        
        //Act:
        viewModel.addSite(from: "google.com")
        
        //Assert:
        XCTAssertEqual(storage.sites.count, 10)
        XCTAssertTrue(delegate.didReachLimitCalled)
    }
    
    func testAddSiteCallsDelegateWhenURLIsInvalid() {
        
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        let delegate = MockSiteListViewModelDelegate()
        
        validator.validateResult = nil
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        viewModel.delegate = delegate
        
        //Act:
        viewModel.addSite(from: "google")
        
        //Assert:
        XCTAssertEqual(storage.sites.count, 0)
        XCTAssertTrue(delegate.didReceiveInvalidURLCalled)
    }
    
    func testRecoverSitesCallsDelegateWhenRecoveryIsPartial() {
        
        //Arrange:
        let storage = MockStorageService()
        let validator = MockURLValidator()
        let delegate = MockSiteListViewModelDelegate()
        
        storage.sites = Array(repeating: Site(url: "https://current.com"),count: 5)
        
        storage.deletedSites = Array(repeating: Site(url: "https://deleted.com"),count: 10)
        
        let viewModel = SiteListViewModel(storage: storage, validator: validator)
        
        viewModel.delegate = delegate
        
        //Act:
        viewModel.recoverSites()
        
        //Assert:
        XCTAssertEqual(storage.sites.count, 10)
        XCTAssertTrue(delegate.didPartiallyRecoverSitesCalled)
        
    }

}


