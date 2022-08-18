//
//  ChangeTests.swift
//  GBShopTests
//
//  Created by Максим Лосев on 18.08.2022.
//

import XCTest
@testable import GBShop

class ChangeTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var testRequest: ChangeRequestFactory!
    
    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
        testRequest = RequestFactory().makeChangeFactory()
    }
    
    override func tearDownWithError() throws {
        errorParser = nil
        testRequest = nil
    }
    
    func testChange() {
        testRequest.change(userId: 123,
                           username: "Somebody",
                           password: "mypassword",
                           email: "some@some.ru",
                           gender: "m",
                           payCard: "9872389-2424-234224-234",
                           bio: "This is good! I think I will switch to another language") { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1, "Registration failed")
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
