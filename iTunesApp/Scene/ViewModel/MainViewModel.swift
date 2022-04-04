//
//  MainViewModel.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation
import RxRelay
import RxSwift

// Normally, for every part of app like search, list, detail etc. should have their own ViewModel but in this case we need just 1 ViewModel so this MainViewModel is enough and make sense to use this way.

class MainViewModel {
//    var productModel: Observable<ProductsModel>?
    let productModel = PublishSubject<ProductsModel>()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()
    private let disposable = DisposeBag()
    
    func getProducts() {
        self.isLoading.onNext(true)
        ProductsRepo.getProducts { response in
            self.isLoading.onNext(false)
            self.productModel.onNext(response)
            self.productModel.onCompleted()
            print("a: response \(response)")
        } failure: { error in
            self.isLoading.onNext(false)
            self.error.onNext(error)
        }
    }
}
