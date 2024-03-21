//
//  GenreViewController.swift
//  WATMDB107
//
//  Created by Pavlo on 07.03.2024.
//

import UIKit

enum SectionType {
    case movie
    case tv
    
    var title: String {
        switch self {
        case .movie:
            return "Movie"
        case .tv:
            return "TV Show"
        }
    }
}

struct Section {
    let type: SectionType
    let item: [String]
}

class GenreViewController: UITableViewController {
    
    private let networkService = NetworkService()
    
    private var movies: [Movie] = []
    
    var coordinator: MainCoordinator?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFavoriteButton()
        registerCells()
        fetchMovies()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeue(MovieTableViewCell.self, forIndexPath: indexPath)
        cell.setupCell(movie: movie)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetails(indexPath: indexPath)
    }
    
    private func setupFavoriteButton() {
        let image = UIImage(systemName: "bookmark.fill")
        let favoriteButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(favoriteButtonAction))
        navigationItem.rightBarButtonItems = [favoriteButton]
    }
    
    private func showDetails(indexPath: IndexPath) {
        guard movies.indices.contains(indexPath.row) else { return }
        let movie = movies[indexPath.row]
        coordinator?.showDetails(movie: movie)
    }
    
    private func fetchMovies() {
        networkService.getMovies { [weak self] result in
            switch result {
            case .success(let page):
                self?.movies = page.results
                self?.tableView.reloadData()
            case .failure(let error):
                self?.coordinator?.showError(error)
            }
        }
    }
    
    private func registerCells() {
        tableView.registerFromNib(MovieTableViewCell.self)
    }
    
    @objc
    private func favoriteButtonAction() {
        coordinator?.showFavorites()
    }
}
