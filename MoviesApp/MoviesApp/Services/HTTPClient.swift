//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMovies(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        guard let url = URL.forMoviesByName(search) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data,response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
