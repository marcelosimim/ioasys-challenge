//
//  CustomTextField.swift
//  ioasysBook
//
//  Created by Marcelo Simim on 10/02/22.
//

import UIKit

class CustomTextField: UITextField {
    var textPadding = UIEdgeInsets(
        top: 16,
        left: 16,
        bottom: 16,
        right: 16
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
