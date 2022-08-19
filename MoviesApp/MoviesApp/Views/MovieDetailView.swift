//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailViewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailViewModel.poster)
                    .cornerRadius(10)
                
                Text(movieDetailViewModel.title)
                    .font(.title)
                
                Text(movieDetailViewModel.plot)
                
                Text("Director")
                    .fontWeight(.bold)
                
                Text(movieDetailViewModel.director)
                
                HStack {
                    Rating(rating: .constant(movieDetailViewModel.rating))
                    Text("\(movieDetailViewModel.rating)/10")
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(movieDetailViewModel.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetailViewModel: MovieDetailViewModel())
    }
}
