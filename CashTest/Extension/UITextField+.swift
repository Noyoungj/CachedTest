//
//  UITextField+.swift
//  CashTest
//
//  Created by 노영재(Youngjae No)_인턴 on 4/17/24.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        layoutSubviews()
    }
}
