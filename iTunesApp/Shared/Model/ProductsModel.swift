//
//  ProductsModel.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation

// If you are not going to use Equatable, remove it then.

// MARK: - ProductsModel
struct ProductsModel: Codable, Equatable {
    let resultCount: Int?
    let results: [Product]?
    
    static func == (lhs: ProductsModel, rhs: ProductsModel) -> Bool {
        return lhs.results == rhs.results && lhs.resultCount == rhs.resultCount
    }
}

// MARK: - Product
struct Product: Codable, Equatable {
    let collectionName, artworkUrl100, releaseDate, currency, longDescription, kind: String?
    let collectionPrice: Double?
    let trackId: Int?
}
