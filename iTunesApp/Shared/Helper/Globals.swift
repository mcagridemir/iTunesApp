//
//  Globals.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation
import UIKit
import SwiftyUserDefaults

class Globals {
    static let shared = Globals()
    var LanguageCode = LangCode.en.rawValue
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let BaseWebserviceUrl = "https://\(Bundle.main.infoDictionary?["ApiBase"] as? String ?? "")"
    var removedItemIds: [String]? {
        return Defaults[\.RemovedItemIds]
    }
    var title: String? {
        return Defaults[\.Title]
    }
}
