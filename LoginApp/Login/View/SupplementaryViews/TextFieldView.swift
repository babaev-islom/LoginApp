//
//  TextFieldView.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit

class TextFieldView : UIView {
    
    let label = UILabel.makeLabel(weight: .bold)
    
    var textField : CustomTextField
    
    init(type: TextFieldType) {
        textField = CustomTextField(type: type)
        
        super.init(frame: .zero)
        
        style(type: type)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func style(type: TextFieldType) {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
        case .email:
            label.text = "Email"
        case .password:
            label.text = "Password"
        }
        
        label.textColor = UIColor(hex: "#161616FF")
        
    }
    
    private func layout() {
        addSubview(label)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
}
