//
//  LoginView.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit

class LoginView : UIView {
    
    let signInLabel = UILabel.makeLabel(text: "Sign In", fontSize: 32.0, weight: .bold) //#262626
    
    let emailView = TextFieldView(type: .email)
    
    let passwordView = TextFieldView(type: .password) //#F5F7FD //#56585B //#161616
    
    let signInButton = UIButton.makeButton(with: "Sign In", tintColor: .white) //#2B2186
    
    let signUpButton = UIButton.makeButton(with: "Sign Up")
    
    let forgotPswdButton = UIButton.makeButton(with: "Forgot a password?") //#251885
    
    var signInClosure: ((_ email: String, _ password: String) -> Void)?
    
    var isEmailValid: Bool = false
    
    var isPasswordValid: Bool = false
    
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
        
        signInLabel.textColor = UIColor(hex: "#262626FF")
        
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .systemGray
        signInButton.layer.cornerRadius = 10.0
        signInButton.isEnabled = false
        
        emailView.textField.layer.cornerRadius = 8.0
        
        passwordView.textField.layer.cornerRadius = 8.0
        
        signUpButton.setTitleColor(UIColor(hex: "#251885FF"), for: .normal)
        
        forgotPswdButton.setTitleColor(UIColor(hex: "#251885FF"), for: .normal)
    }
    
    private func layout() {
        addSubview(signInLabel)
        addSubview(emailView)
        addSubview(passwordView)
        addSubview(signInButton)
        addSubview(signUpButton)
        addSubview(forgotPswdButton)
        
        NSLayoutConstraint.activate([
            signInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            
            emailView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 50),
            emailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 16),
            passwordView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            signInButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 24),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 32),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            forgotPswdButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
            forgotPswdButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    private func setupTargets() {
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .primaryActionTriggered)
        emailView.textField.delegate = self
        passwordView.textField.delegate = self
        
        emailView.textField.addTarget(self, action: #selector(validateEmail), for: .editingDidEnd)
        passwordView.textField.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
    }

    @objc func validateEmail() {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValid = emailPred.evaluate(with: emailView.textField.text)
        if isValid {
            isEmailValid = true
        } else {
            isEmailValid = false
        }
    }
    
    @objc func validatePassword() {
        if passwordView.textField.hasText {
            isPasswordValid = true
        } else {
            isPasswordValid = false
        }
    }

    
    @objc func handleSignIn() {
        guard emailView.textField.text != nil, passwordView.textField.text != nil else { return }
        signInClosure?(emailView.textField.text!,passwordView.textField.text!)
    }
    
    private func checkFields(valid: Bool) {
        if valid {
            signInButton.backgroundColor = UIColor(hex: "#2B2186FF")
        } else {
            signInButton.backgroundColor = .systemGray
        }
        signInButton.isEnabled = valid
    }
}

extension LoginView : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkFields(valid: isEmailValid && isPasswordValid)
    }
}
