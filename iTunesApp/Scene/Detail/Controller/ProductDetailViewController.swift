//
//  ProductDetailViewController.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 6.04.2022.
//

import UIKit

class ProductDetailViewController: BaseViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var imageUrl: String?
    private var name: String?
    private var longDescription: String?
    
    func setVariables(imageUrl: String?, name: String?, longDescription: String?) {
        self.imageUrl = imageUrl
        self.name = name
        self.longDescription = longDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        setHeaderNativeBackTitleWhite(title: self.name ?? "")
        imageView.isSkeletonable = true
        imageView.showAnimatedGradientSkeleton()
        imageView.sd_setImage(with: URL(string: imageUrl?.replace(target: "100x100", withString: "800x800") ?? "")) { [weak self] _, _, _, _ in
            guard let self = self else { return }
            self.imageView.hideSkeleton()
            self.imageView.isSkeletonable = false
        }
        titleLabel.text = name ?? ""
        descriptionLabel.text = longDescription ?? ""
    }
}
