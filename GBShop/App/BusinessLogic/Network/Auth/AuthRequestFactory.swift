//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Максим Лосев on 05.08.2022.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
