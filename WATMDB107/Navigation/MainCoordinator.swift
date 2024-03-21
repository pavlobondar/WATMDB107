//
//  MainCoordinator.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showGernes()
    }
    
    func showGernes() {
        let genreViewController = GenreViewController.instantiate()
        genreViewController.coordinator = self
        navigationController.pushViewController(genreViewController, animated: false)
    }
    
    func showDetails(movie: Movie) {
        let detailViewController = DetailViewController.instantiate()
        detailViewController.coordinator = self
        detailViewController.movie = movie
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func showFavorites() {
        let favoritesViewController = FavoriteViewController.instantiate()
        favoritesViewController.coordinator = self
        navigationController.pushViewController(favoritesViewController, animated: true)
    }
    
    func showError(_ error: Error) {
        let title = "Error"
        let message = error.localizedDescription
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(.init(title: "Cancel", style: .cancel))
        navigationController.present(alertViewController, animated: true)
    }
}
