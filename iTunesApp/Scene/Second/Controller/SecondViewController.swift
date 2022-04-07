//
//  SecondViewController.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import RxCocoa
import RxSwift
import UIKit

class SecondViewController: BaseViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
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
        tableView.registerNib(ProductTableViewCell.self)
        // Bind item to table view
        viewModel.filteredProducts.bind(
            to: tableView.rx.items(
                cellIdentifier: "ProductTableViewCell",
                cellType: ProductTableViewCell.self)
        ) { row, item, cell in
            cell.initCell(product: item, isImageHidden: true)
        }.disposed(by: bag)
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind { product in
            MainRouter.navigateToDetail(nav: self.navigationController, imageUrl: product.artworkUrl100, name: product.collectionName, longDescription: product.longDescription)
        }
        
        viewModel.filteredProducts.asObservable().subscribe { products in
            self.countLabel.text = LocalizationKeys.resultFound(products.count)
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
        
        // fetch items
        viewModel.getProducts()
    }
}
