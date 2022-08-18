//
//  LogoutTests.swift
//  GBShopTests
//
//  Created by Максим Лосев on 18.08.2022.
//

import XCTest
@testable import GBShop

class LogoutTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var testRequest: LogoutRequestFactory!
    
    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
        testRequest = RequestFactory().makeLogoutFactory()
    }
    
    override func tearDownWithError() throws {
        errorParser = nil
        testRequest = nil
        super.tearDown()
    }
    
    func testLogout() {
        testRequest.logout(userId: 123) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1, "Logout not possible")
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
