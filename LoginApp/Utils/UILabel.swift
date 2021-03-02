//
//  UILabel.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import UIKit

extension UILabel {
    static func makeLabel(text: String = "", fontSize: CGFloat = 14.0, weight: UIFont.Weight = .regular ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        return label
    }
}
