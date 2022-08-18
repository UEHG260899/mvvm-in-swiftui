//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import Foundation


class MovieListViewModel: ViewModelBase {

    @Published var movies = [MovieViewModel]()
    @Published var searchQuery = ""
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            return
        }
        
        loadingState = .loading
        
        httpClient.getMovies(search: name.urlSafeString) { [weak self] result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self?.movies = movies.map(MovieViewModel.init)
                        self?.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.loadingState = .failed
                }
            }
        }
    }
    
    
}

struct MovieViewModel {
    
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbId
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
