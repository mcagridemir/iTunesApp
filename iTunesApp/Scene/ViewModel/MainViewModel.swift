//
//  MainViewModel.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation
import RxRelay
import RxSwift
import SwiftyUserDefaults

// Normally, for every part of app like search, list, detail etc. should have their own ViewModel but in this case we need just 1 ViewModel so this MainViewModel is enough and make sense to use this way.

class MainViewModel {
    let products = PublishSubject<[Product]>()
    let filteredProducts = PublishSubject<[Product]>()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()
    private let disposable = DisposeBag()
    
    func getProducts() {
        self.isLoading.onNext(true)
        ProductsRepo.getProducts { response in
            self.isLoading.onNext(false)
            if var products = response.results {
                var filteredProducts = [Product]()
                products.forEach { product in
                    if !(Defaults[\.RemovedItemIds]?.contains(obj: String(product.trackId ?? 0)) ?? false) {
                        filteredProducts.append(product)
                    }
                }
                self.filteredProducts.onNext(filteredProducts)
            }
            self.products.onCompleted()
        } failure: { error in
            self.isLoading.onNext(false)
            self.error.onNext(error)
        }
    }
}
