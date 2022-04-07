//
//  ProdCollectionViewCell.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 6.04.2022.
//

import SDWebImage
import SkeletonView
import UIKit

protocol ProdDelegate: AnyObject {
    func removeItem(id: Int?)
}

class ProdCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    private var id: Int?
    private weak var delegate: ProdDelegate?
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCell(product: Product?, delegate: ProdDelegate?) {
        self.delegate = delegate
        self.id = product?.trackId
        imageView.isSkeletonable = true
        imageView.showAnimatedGradientSkeleton()
        imageView.sd_setImage(with: URL(string: product?.artworkUrl100 ?? "")) { [weak self] image, _, _, _ in
            guard let self = self else { return }
            self.imageView.hideSkeleton()
            self.imageView.isSkeletonable = false
            self.imageView.image = image
        }
        artistLabel.text = product?.artistName
        trackLabel.text = product?.trackName
        let tlSign = "₺"
        dateLabel.text = product?.formattedDate
        priceLabel.text =  tlSign + String(product?.collectionPrice ?? 0)
        closeImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCloseTapped))
        closeImageView.addGestureRecognizer(gesture)
        DispatchQueue.main.async {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    @objc private func didCloseTapped() {
        delegate?.removeItem(id: id)
    }
}
