//
//  MoviewListView.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import SwiftUI

struct MovieListView: View {
    
    
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            MoviewCell(movie: movie)
        }
        .listStyle(.plain)
    }
}

struct MoviewListView_Previews: PreviewProvider {
    
    static let movie = Movie(title: "Hol", year: "12", imdbId: "1", poster: "jij")
    
    static var previews: some View {
        MovieListView(movies: [MovieViewModel(movie: movie)])
    }
}

struct MoviewCell: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }
            .padding(5)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
