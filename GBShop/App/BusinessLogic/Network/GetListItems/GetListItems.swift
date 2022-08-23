//
//  GetListItems.swift
//  GBShop
//
//  Created by Максим Лосев on 18.08.2022.
//

import Alamofire

class GetListItems: AbstractRequestFactory {
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

extension GetListItems: GetListItemsFactory {
    func getListItems(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[ProductItemInList]>) -> Void) {
        let requestModel = ListItems(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetListItems {
    struct ListItems: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "catalogData"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ]
        }
    }
}
