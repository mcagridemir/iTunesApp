//
//  Bindable.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> Void)?
    
    func bind(observer: @escaping (T?) -> Void) {
        self.observer = observer
    }
    
}
