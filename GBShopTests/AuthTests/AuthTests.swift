//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Максим Лосев on 16.08.2022.
//

import XCTest
@testable import GBShop

class AuthTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var testRequest: AuthRequestFactory!
    
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
        testRequest = RequestFactory().makeAuthRequestFatory()
    }
    
    override func tearDown() {
        errorParser = nil
        testRequest = nil
        super.tearDown()
    }
    
    func testAuthWithCorrectCredentials() {
        testRequest.login(userName: "somebody", password: "mypassword") { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1, "Authentication failed")
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
