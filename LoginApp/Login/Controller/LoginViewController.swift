//
//  ViewController.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit

class LoginViewController: UIViewController {

    let _view = LoginView()

    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension LoginViewController {
    private func setup() {
        _view.signInClosure = { [weak self] (email, password) in
            guard let self = self else { return }
            self.loginRequest(email: email, password: password)
        }
    }
    
    
    private func loginRequest(email: String, password: String) {
        let params : [String : AnyHashable] = [
            "email": email, //"junior-ios-developer@mailinator.com"
            "password": password, //"s4m8AJDbVvX4H8aF"
            "project_id": "58b3193b-9f15-4715-a1e3-2e88e375f62b"
        ]
        
        NetworkManager.Login.login(params: params) { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let res):
                guard res.error == nil else {
                    self.showAlert(title: "We could not sign you in", error: "You are \(res.error!.lowercased()) or you have wrong credentials")
                    return
                }
                UserData.shared.token = res.accessToken
                UIView.animate(withDuration: 0.5) {
                    UIApplication.shared.windows[0].rootViewController = DefaultTabBarController()
                    UIApplication.shared.windows[0].makeKeyAndVisible()
                }

            case .failure(let err):
                self.showAlert(title: "Request Error", error: err.localizedDescription)
            }
        }
    }
}
