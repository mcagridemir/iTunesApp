//
//  ThirdViewController.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import RxCocoa
import RxSwift
import UIKit

class ThirdViewController: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = MainViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getProducts()
    }
    
    private func bindData() {
        initCollectionView()
        viewModel.filteredProducts.bind(to: collectionView.rx.items(cellIdentifier: "ProductGridCollectionViewCell", cellType: ProductGridCollectionViewCell.self)) { row, item, cell in
            cell.initCell(product: item)
        }.disposed(by: bag)
        collectionView.rx.modelSelected(Product.self).bind { product in
            MainRouter.navigateToDetail(nav: self.navigationController, imageUrl: product.artworkUrl100, name: product.collectionName, longDescription: product.longDescription)
        }.disposed(by: bag)
        
        viewModel.isLoading.asObservable().subscribe { status in
            status ? Loader.show() : Loader.hide()
        }.disposed(by: bag)
        
        viewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe { error in
                Alert.error(title: "", text: error.rawValue)
            }
            .disposed(by: bag)
        
        viewModel.getProducts()
    }
    
    private func initCollectionView() {
        collectionView.registerNib(ProductGridCollectionViewCell.self)
        collectionView.rx.setDelegate(self).disposed(by: bag)
    }
}

extension ThirdViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Globals.shared.screenWidth
        let cellWidth = (width - 95) / 2 // compute your cell width
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
