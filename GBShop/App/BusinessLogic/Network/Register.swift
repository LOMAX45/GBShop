//
//  Register.swift
//  GBShop
//
//  Created by Максим Лосев on 07.08.2022.
//

import Alamofire

class Register: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Register: RegRequestFactory {
    func register(userId: Int, username: String, password: String, email: String, gender: String, payCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegResult>) -> Void) {
        let requestModel = Registration(baseUrl: baseUrl, userId: userId, username: username, password: password, email: email, gender: gender, payCard: payCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Register {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
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
