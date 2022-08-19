//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import Foundation

extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constants.apiKey)")
    }
    
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.apiKey)")
    }
}
