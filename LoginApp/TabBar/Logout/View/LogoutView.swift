//
//  LogoutView.swift
//  LoginApp
//
//  Created by Islom on 02/03/21.
//

import UIKit

class LogoutView : UIView {
    
    let logoutButton = UIButton.makeButton(with: "LogOut", tintColor: .systemPink, fontSize: 35.0)
    
    var logoutClosure: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        style()
        layout()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func style() {
        backgroundColor = .white
    }
    
    private func layout() {
        addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupTargets() {
        logoutButton.addTarget(self, action: #selector(logout), for: .primaryActionTriggered)
    }
    
    @objc func logout() {
        logoutClosure?()
    }
    
}
