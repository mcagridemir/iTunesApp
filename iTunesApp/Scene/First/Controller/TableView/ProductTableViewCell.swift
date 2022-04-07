//
//  ProductTableViewCell.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 5.04.2022.
//

import UIKit
import SDWebImage
import SkeletonView

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLblLeadingViewConst: NSLayoutConstraint!
    @IBOutlet weak var trackLblLeadingViewConst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func initCell(product: Product?, isImageHidden: Bool = false) {
        prodImageView.isHidden = isImageHidden
        if !isImageHidden {
            prodImageView.isSkeletonable = true
            prodImageView.showAnimatedGradientSkeleton()
            prodImageView.sd_setImage(with: URL(string: product?.artworkUrl100 ?? "")) { [weak self] _, _, _, _ in
                guard let self = self else { return }
                self.prodImageView.hideSkeleton()
                self.prodImageView.isSkeletonable = false
            }
        }
        DispatchQueue.main.async {
            self.artistLblLeadingViewConst.constant = isImageHidden ? 20 : 60
            self.trackLblLeadingViewConst.constant = isImageHidden ? 20 : 60
        }
        artistLabel.text = product?.artistName ?? ""
        trackLabel.text = product?.trackName ?? ""
    }
}
