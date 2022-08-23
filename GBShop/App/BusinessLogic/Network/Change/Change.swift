//
//  Change.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Alamofire

class Change: AbstractRequestFactory {
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

extension Change: ChangeRequestFactory {
    func change(userId: Int, username: String, password: String, email: String, gender: String, payCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void) {
        let requestModel = Change(baseUrl: baseUrl, userId: userId, username: username, password: password, email: email, gender: gender, payCard: payCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Change {
    struct Change: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "change"
        let userId: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let payCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": payCard,
                "bio": bio
            ]
        }
    }
}
