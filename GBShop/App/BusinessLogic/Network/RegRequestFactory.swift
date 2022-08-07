//
//  RegRequestFactory.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Alamofire

protocol RegRequestFactory {
    func register(userId: Int, username: String, password: String, email: String, gender: String, payCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegResult>) -> Void)
}
