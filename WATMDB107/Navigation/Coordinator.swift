//
//  Coordinator.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
