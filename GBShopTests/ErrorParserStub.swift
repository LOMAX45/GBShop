//
//  ErrorParserStub.swift
//  GBShopTests
//
//  Created by Максим Лосев on 16.08.2022.
//

import XCTest
@testable import GBShop

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
