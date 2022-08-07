//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Максим Лосев on 05.08.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse (_ result: Error) -> Error
    func parse (response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
