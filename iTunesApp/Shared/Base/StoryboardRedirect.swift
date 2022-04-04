//
//  StoryboardRedirect.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import UIKit

enum StoryboardRedirect: String {
    case ApplicationMain = "ApplicationMain"
    
    var instance: UIStoryboard {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}
