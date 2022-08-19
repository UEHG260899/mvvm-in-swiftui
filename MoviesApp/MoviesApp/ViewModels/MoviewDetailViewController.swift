//
//  MoviewDetailViewController.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    @Published var loadingState: LoadingState = .loading
    
    private var movieDetail: MovieDetail?
    private var httpClient = HTTPClient()
    
    var title: String {
        movieDetail?.title ?? ""
    }
    
    var poster: String {
        movieDetail?.poster ?? ""
    }
    
    var plot: String {
        movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        let ratingAsDouble = Double(movieDetail?.imdbRating ?? "0.0")
        return Int(ceil(ratingAsDouble ?? 0.0))
    }
    
    var director: String {
        movieDetail?.director ?? ""
    }
    
    init(moviewDetail: MovieDetail? = nil) {
        self.movieDetail = moviewDetail
    }
    
    func getDetailsByImdbId(_ imdbId: String) {
        httpClient.getMovieDetailsBy(imdbId: imdbId) { [weak self] result in
            switch result {
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    self?.movieDetail = movieDetails
                    self?.loadingState = .success
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
