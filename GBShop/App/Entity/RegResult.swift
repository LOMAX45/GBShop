//
//  RegResult.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Foundation

struct RegResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
    
}
