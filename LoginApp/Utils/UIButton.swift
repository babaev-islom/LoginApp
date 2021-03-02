//
//  UIButton.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit

extension UIButton {
    static func makeButton(with title: String, tintColor: UIColor = .systemPurple, fontSize: CGFloat = 17.0) -> UIButton {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = tintColor
        let attributedTitle = NSAttributedString(string: title, attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: fontSize, weight: .bold)
        ])
        btn.setAttributedTitle(attributedTitle, for: .normal)
        return btn
    }
}
