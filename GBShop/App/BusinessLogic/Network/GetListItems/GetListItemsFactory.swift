//
//  GetListItemsFactory.swift
//  GBShop
//
//  Created by Максим Лосев on 18.08.2022.
//

import Alamofire

protocol GetListItemsFactory {
    func getListItems(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[ProductItemInList]>) -> Void)
}
