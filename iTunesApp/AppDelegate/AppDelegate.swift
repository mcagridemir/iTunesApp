//
//  AppDelegate.swift
//  iTunesApp
//
//  Created by Çağrı Demir on 3.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        MainRouter.showTabBar()
        return true
    }
}

