//
//  GetProductTests.swift
//  GBShopTests
//
//  Created by Максим Лосев on 18.08.2022.
//

import XCTest
@testable import GBShop

class GetProductTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var testRequest: GetProductFactory!

    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
        testRequest = RequestFactory().makeGetProductFactory()
    }

    override func tearDownWithError() throws {
        errorParser = nil
        testRequest = nil
        super.tearDown()
    }

    func testGetProduct() {
        testRequest.getProduct(id: 123) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1, "Product doesn't exist in store")
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
