//
//  AppDelegate.swift
//  GBShop
//
//  Created by Максим Лосев on 04.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let logout = requestFactory.makeLogoutFactory()
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error)
            }
        }
        
        let register = requestFactory.makeRegisterFactory()
        register.register(userId: 123,
                          username: "Somebody",
                          password: "mypassword",
                          email: "some@some.ru",
                          gender: "m",
                          payCard: "9872389-2424-234224-234",
                          bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error)
            }
        }
        
        let changer = requestFactory.makeChangeFactory()
        changer.change(userId: 123,
                       username: "Somebody",
                       password: "mypassword",
                       email: "some@some.ru",
                       gender: "m",
                       payCard: "9872389-2424-234224-234",
                       bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let changer):
                print(changer)
            case .failure(let error):
                print(error)
            }
        }
        
        let getterList = requestFactory.makeGetListItemsFactory()
        getterList.getListItems(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let listItems):
                print(listItems)
            case .failure(let error):
                print(error)
            }
        }
        
        let getterProduct = requestFactory.makeGetProductFactory()
        getterProduct.getProduct(id: 123) { responce in
            switch responce.result {
            case .success(let product):
                print(product)
            case .failure(let error):
                print(error)
            }
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

