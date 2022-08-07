//
//  UserPersonalData.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Foundation

struct UserPersonalData: Codable {
    let id: Int
    let username: String
    let password: String
    let email: String
    let gender: String
    let payCard: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case username = "username"
        case password = "password"
        case email = "email"
        case gender = "gender"
        case payCard = "credit_card"
        case bio = "bio"
    }
}
