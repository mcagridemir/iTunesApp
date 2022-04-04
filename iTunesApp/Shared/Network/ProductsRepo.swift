//
//  ProductsRepo.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation

class ProductsRepo {
    class func getProducts(success: @escaping(_ response: ProductsModel) -> Void, failure: @escaping(_ error: Error) -> Void) {
        APIManager.shared.fetchApi(router: .Get) { (response: ProductsModel) in
            success(response)
        } callbackFailure: { error in
            failure(error)
        }
    }
}
