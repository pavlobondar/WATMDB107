//
//  UIView+CornerRadius.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import UIKit

extension UIView {
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
