//
//  FirstViewController.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import RxCocoa
import RxSwift
import UIKit

class FirstViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = MainViewModel()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getProducts()
    }
    
    private func bindTableData() {
        tableView.registerNib(ProductTableViewCell.self)
        // Bind item to table view
        viewModel.filteredProducts.bind(
            to: tableView.rx.items(
                cellIdentifier: "ProductTableViewCell",
                cellType: ProductTableViewCell.self)
        ) { row, item, cell in
            cell.initCell(product: item)
        }.disposed(by: bag)
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind { product in
            MainRouter.navigateToDetail(nav: self.navigationController, imageUrl: product.artworkUrl100, name: product.collectionName, longDescription: product.longDescription)
        }
        
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
