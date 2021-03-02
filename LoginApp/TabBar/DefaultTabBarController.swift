//
//  DefaultTabBarController.swift
//  LoginApp
//
//  Created by Islom on 02/03/21.
//

import UIKit

class DefaultTabBarController : UITabBarController {
    let vc1 = makeTabVC(vc: LogoutViewController(), title: "Projects", image: UIImage(systemName: "star.fill"), selectedImage: nil)
    
    let vc2 = makeTabVC(vc: LogoutViewController(), title: "Home", image: UIImage(systemName: "star.fill"), selectedImage: nil)
    
    let vc3 = makeTabVC(vc: LogoutViewController(), title: "Settings", image: UIImage(systemName: "star.fill"), selectedImage: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs(){
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.systemBlue
        viewControllers = [vc1, vc2, vc3]
    }
}

fileprivate func makeTabVC(vc: UIViewController, title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil) -> UIViewController {
    
    let tab = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
    tab.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    let nc = UINavigationController(rootViewController: vc)
    nc.navigationBar.isHidden = true
    nc.tabBarItem = tab
    
    return nc
}
