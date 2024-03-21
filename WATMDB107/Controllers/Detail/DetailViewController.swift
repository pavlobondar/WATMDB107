//
//  DetailViewController.swift
//  WATMDB107
//
//  Created by Pavlo on 14.03.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var coordinator: MainCoordinator?
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMovieData()
    }
    
    private func showMovieData() {
        guard let movie = movie else { return }
        
        title = movie.title
        posterImageView.load(path: movie.backdropPath)
        titleLabel.text = movie.originalLang
        subtitleLabel.text = movie.overview
    }
}
