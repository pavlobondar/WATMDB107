//
//  NetworkService.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import Foundation
import Alamofire

class NetworkService {
    
    let path = "https://api.themoviedb.org/3/discover/movie?api_key=389e1457e30fd1328b41bb9ee9f2a93b"
    
    func getMovies(completion: @escaping (Result<Page, Error>) -> Void) {
        AF.request(path)
            .validate()
            .responseDecodable(of: Page.self) { response in
                switch response.result {
                case .success(let success):
                    completion(.success(success))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
    }
}
