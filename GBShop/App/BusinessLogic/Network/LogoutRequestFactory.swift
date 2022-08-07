//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Alamofire

protocol LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
