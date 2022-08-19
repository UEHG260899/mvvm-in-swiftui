//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    let poster: String
    let imdbId: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title",
        year = "Year",
        rated = "Rated",
        plot = "Plot",
        director = "Director",
        actors = "Actors",
        imdbRating,
        poster = "Poster",
        imdbId = "imdbID"
    }
}
