//
//  LogoutViewController.swift
//  LoginApp
//
//  Created by Islom on 02/03/21.
//

import UIKit

class LogoutViewController : UIViewController {
    
    let _view = LogoutView()
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

}

extension LogoutViewController {
    private func setup() {
        _view.logoutClosure = { [weak self] in
            guard let self = self else { return }
            UserData.shared.token = nil
            UIView.animate(withDuration: 0.5) {
                UIApplication.shared.windows[0].rootViewController = LoginViewController()
                UIApplication.shared.windows[0].makeKeyAndVisible()
            }
            
        }
    }
}

