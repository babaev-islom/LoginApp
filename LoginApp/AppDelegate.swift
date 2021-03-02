//
//  AppDelegate.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit
import IQKeyboardManagerSwift


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //setup for keyboard manager
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        var rootVC : UIViewController
        
        if UserData.shared.token == nil {
            rootVC = LoginViewController()
        } else {
            rootVC = DefaultTabBarController()
        }
        
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
}

