//
//  ApplicationMainTabBarViewController.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import RxCocoa
import RxSwift
import SwiftyUserDefaults
import UIKit

class ApplicationMainTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // self.navigationController?.navigationBar.isHidden = true
        setTabBarItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNativeBackImageNField()
    }

    func setNativeBackImageNField() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = Assets.Colors.MainColors.mainWhite.color
        self.navigationController?.navigationBar.tintColor = Assets.Colors.MainColors.mainBlack.color
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        let barSize = self.navigationController?.navigationBar.frame.size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: barSize?.width ?? 0, height: 30))
        let textField = UITextField(frame: CGRect(x: (barSize?.width ?? 0) / 3, y: 0, width: 100, height: 30))
        textField.delegate = self
        textField.returnKeyType = .done
        textField.text = Defaults[\.Title]
        textField.borderStyle = .roundedRect
        let imageView = UIImageView(frame: CGRect(x: ((barSize?.width ?? 0) / 3) - 50, y: 0, width: 30, height: 30))
        imageView.image = Assets.Assets.Icons.smile.image
        view.addSubview(imageView)
        view.addSubview(textField)
        self.navigationItem.titleView = view
    }
    
    func setTabBarItemsFont() {
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 8)]

        let tabBarOne = (self.tabBar.items?[0])! as UITabBarItem
        tabBarOne.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)

        let tabBarTwo = (self.tabBar.items?[1])! as UITabBarItem
        tabBarTwo.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)

        let tabBarThree = (self.tabBar.items?[2])! as UITabBarItem
        tabBarThree.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)

        let tabBarFour = (self.tabBar.items?[3])! as UITabBarItem
        tabBarFour.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)

    }
    
    func setTabBarItems() {
        self.tabBar.tintColor = Assets.Colors.MainColors.mainWhite.color
        self.tabBar.unselectedItemTintColor = Assets.Colors.MainColors.mainGray.color
        self.tabBar.barTintColor = Assets.Colors.MainColors.mainBlack.color
        self.tabBar.isTranslucent = false
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 8)]
        let tabBarOne = (self.tabBar.items?[0])! as UITabBarItem
        tabBarOne.title = LocalizationKeys.one.localized
        tabBarOne.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)
        tabBarOne.image = Assets.Assets.TabBar.home.image
        tabBarOne.selectedImage =  Assets.Assets.TabBar.homeActive.image
        
        let tabBarTwo = (self.tabBar.items?[1])! as UITabBarItem
        tabBarTwo.title = LocalizationKeys.two.localized
        tabBarTwo.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)
        tabBarTwo.image = Assets.Assets.TabBar.feed.image
        tabBarTwo.selectedImage = Assets.Assets.TabBar.feedActive.image
        
        let tabBarThree = (self.tabBar.items?[2])! as UITabBarItem
        tabBarThree.title = LocalizationKeys.three.localized
        tabBarThree.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)
        tabBarThree.image = Assets.Assets.TabBar.shop.image
        tabBarThree.selectedImage = Assets.Assets.TabBar.shopActive.image
        
        let tabBarFour = (self.tabBar.items?[3])! as UITabBarItem
        tabBarFour.title = LocalizationKeys.four.localized
        tabBarFour.setTitleTextAttributes(attributes as [NSAttributedString.Key: Any], for: .normal)
        tabBarFour.image = Assets.Assets.TabBar.bag.image
        tabBarFour.selectedImage = Assets.Assets.TabBar.bagActive.image
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        setTabBarItemsFont()
    }
}

extension ApplicationMainTabBarController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Defaults[\.Title] = textField.text ?? ""
        print("a: Defaults[Title] \(Defaults[\.Title])")
        textField.resignFirstResponder()
         return false
    }
}
