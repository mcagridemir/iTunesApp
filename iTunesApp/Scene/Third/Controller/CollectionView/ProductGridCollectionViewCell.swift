//
//  ProductGridCollectionViewCell.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 5.04.2022.
//

import UIKit

class ProductGridCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCell(product: Product?) {
        artistLabel.text = product?.artistName
        trackLabel.text = product?.trackName
    }
}
