//
//  TableView+Register.swift
//  WATMDB107
//
//  Created by Pavlo on 07.03.2024.
//

import UIKit

public protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }

extension UITableViewHeaderFooterView: ReusableView { }

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFromNib<T: UITableViewCell>(_: T.Type) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: T.self.reuseIdentifier) as? T
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: T.self.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Error: cell with id: \(T.self.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
