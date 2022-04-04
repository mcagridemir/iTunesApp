//
//  ProductTableViewCell.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 5.04.2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}
