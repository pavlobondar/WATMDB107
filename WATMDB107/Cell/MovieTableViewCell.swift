//
//  MovieTableViewCell.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.setCornerRadius(4.0)
    }

    func setupCell(movie: Movie) {
        posterImageView.load(path: movie.posterPath)
        movieTitleLabel.text = movie.title
        movieSubtitleLabel.text = movie.overview
    }
}
