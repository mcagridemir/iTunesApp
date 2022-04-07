//
//  ProductsModel.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation

// TODO: - If you are not going to use Equatable, remove it then.

// TODO: - Remove unnecessary variables when you're done.

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
    let artistName, trackName: String?
    var formattedDate: String? {
        let dateStr =  String(releaseDate?.split(separator: "T").first ?? "")
        return Helper.formatDate(dateTxt: dateStr, inputFormat: "yyyy-MM-dd", outputFormat: "dd/MM/yyyy")
    }
}
