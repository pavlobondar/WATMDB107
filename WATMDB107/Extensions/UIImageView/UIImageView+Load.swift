//
//  UIImageView+Load.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import UIKit
import SDWebImage

extension UIImageView {
    func load(path: String?) {
        guard let path = path else { return }
        sd_setImage(with: URL(string: Constants.imageBaseURL + path))
    }
}
