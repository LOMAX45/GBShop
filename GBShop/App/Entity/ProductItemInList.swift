//
//  ProductItemInList.swift
//  GBShop
//
//  Created by Максим Лосев on 18.08.2022.
//

import Foundation

struct ProductItemInList: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
