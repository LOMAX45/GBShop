//
//  GetListItemsTests.swift
//  GBShopTests
//
//  Created by Максим Лосев on 18.08.2022.
//

import XCTest
@testable import GBShop

class GetListItemsTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    var testRequest: GetListItemsFactory!

    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
        testRequest = RequestFactory().makeGetListItemsFactory()
    }

    override func tearDownWithError() throws {
        errorParser = nil
        testRequest = nil
        super.tearDown()
    }

    func testGetListItems() {
        testRequest.getListItems(pageNumber: 1, idCategory: 1) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertGreaterThan(result.count, 0, "No items found in store")
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
