//
//  MainRouter.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 4.04.2022.
//

import UIKit

// Normally, for every part of app like search, list, detail etc. should have their own Router but in this case we have just 2-3 navigations so this MainRouter is enough and make sense to use this way.

class MainRouter {
    class func showTabBar() {
        guard let vc = StoryboardRedirect.ApplicationMain.instance.instantiateViewController(withIdentifier: "ApplicationMainTabBarController") as? ApplicationMainTabBarController else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window else { return }
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
    }
}
