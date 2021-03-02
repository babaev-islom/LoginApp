//
//  CustomTextField.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit

enum TextFieldType {
    case email
    case password
}

class CustomTextField : UITextField {
    var type: TextFieldType
    
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
        
        style()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func style() {
        var placeholder : String = ""
        
        autocorrectionType = .no
        autocapitalizationType = .none
        
        switch self.type {
        case .email:
            placeholder = "Your email"
            
        case .password:
            placeholder = "Your password"
            isSecureTextEntry = true
        }
        let customLightGrayColor = UIColor(hex: "#56585BFF")
        
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .callout),
            NSAttributedString.Key.foregroundColor : customLightGrayColor ?? .systemGray
        ])
        self.attributedPlaceholder = attributedPlaceholder
        
        tintColor = customLightGrayColor
        textColor = customLightGrayColor
        backgroundColor = UIColor(hex: "#F5F7FDFF")
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
