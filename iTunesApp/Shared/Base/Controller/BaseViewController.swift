//
//  BaseViewController.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import RxCocoa
import RxSwift
import Foundation
import UIKit


class BaseViewController : UIViewController {
    
    lazy var hideNavbar: Bool = false
    var callbackBackButton: Callback?
    var callbackCloseButton: Callback?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(hideNavbar, animated: false)
    }
    
    func setHeaderNativeBackTitleWhite(title: String) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = Assets.Colors.MainColors.mainWhite.color
        self.navigationController?.navigationBar.tintColor = Assets.Colors.MainColors.mainBlack.color
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith(colorfulImage: Assets.Assets.Icons.goBack.image, target: self, action: #selector(btnBackClicked))
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        let titleLabel = UILabel()
        titleLabel.text = title.uppercased()
        titleLabel.textColor = Assets.Colors.MainColors.mainBlack.color
        self.navigationItem.titleView = titleLabel
    }
    
    func setHeaderNativeBackTitleCross(title: String) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = Assets.Colors.MainColors.mainWhite.color
        self.navigationController?.navigationBar.tintColor = Assets.Colors.MainColors.mainBlack.color
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.itemWith(colorfulImage: Assets.Assets.Icons.goBack.image, target: self, action: #selector(btnBackClicked))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.itemWithRight(colorfulImage: Assets.Assets.Icons.iconCross.image, target: self, action: #selector(btnCloseClicked))
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        let titleLabel = UILabel()
        titleLabel.text = title.uppercased()
        titleLabel.textColor = Assets.Colors.MainColors.mainBlack.color
        self.navigationItem.titleView = titleLabel
    }
    
    @objc func btnBackClicked() {
        self.navigationController?.popViewController(animated: true)
        self.callbackBackButton?()
    }
    
    @objc func btnCloseClicked() {
        self.navigationController?.popViewController(animated: true)
        self.callbackCloseButton?()
    }
    
    func onReturn(callback: Callback?) {
        self.callbackBackButton = callback
    }
    
    func onClose(callback: Callback?) {
        self.callbackCloseButton = callback
    }
}
