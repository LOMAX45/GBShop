//
//  ErrorParser.swift
//  GBShop
//
//  Created by Максим Лосев on 05.08.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
