//
//  GetProduct.swift
//  GBShop
//
//  Created by Максим Лосев on 18.08.2022.
//

import Alamofire

class GetProduct: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://frozen-garden-31873.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension GetProduct: GetProductFactory {
    
    func getProduct(id: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void) {
        let requestModel = GetProduct(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension GetProduct {
    struct GetProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodById"
        let id: Int
        var parameters: Parameters? {
            return [
                "id_product": id
            ]
        }
    }
}
