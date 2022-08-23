//
//  Logout.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Alamofire

class Logout: AbstractRequestFactory {
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

extension Logout: LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        let userId: Int
        var parameters: Parameters? {
            return [
                "id_user": userId,
            ]
        }
    }
}
