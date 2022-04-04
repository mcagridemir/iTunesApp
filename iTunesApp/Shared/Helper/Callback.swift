//
//  Callback.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation

public typealias Callback = () -> Void
public typealias CallbackString = (_ result: String) -> Void
public typealias CallbackInt = (_ result: Int) -> Void
public typealias CallbackBool = (_ result: Bool) -> Void
public typealias CallbackGeneric<T> = (_ result: T) -> Void
