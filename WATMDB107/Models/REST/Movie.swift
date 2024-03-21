//
//  Movie.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import Foundation

struct Page: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let originalLang: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    let video: Bool
    let voteAverage: Double
    let voteCount: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLang = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
