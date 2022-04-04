//
//  BaseTableViewCell.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import Foundation
import UIKit

class BaseTableViewCell<T: Any>: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {}
    
    func set(item: T?) {}
}
