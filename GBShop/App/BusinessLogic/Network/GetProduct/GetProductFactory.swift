//
//  GetProductFactory.swift
//  GBShop
//
//  Created by Максим Лосев on 18.08.2022.
//

import Alamofire

protocol GetProductFactory {
    func getProduct(id: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void)
}
