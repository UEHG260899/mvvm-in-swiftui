//
//  MovieDetailsScreen.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    @StateObject var viewModel: MovieDetailViewModel = MovieDetailViewModel()
    let imdbId: String
    
    var body: some View {
        VStack {
            if viewModel.loadingState == .loading {
                Text("Loading...")
            } else if viewModel.loadingState == .success {
                MovieDetailView(movieDetailViewModel: viewModel)
            } else if viewModel.loadingState == .failed {
                FailedView()
            }
        }
        .onAppear {
            viewModel.getDetailsByImdbId(imdbId)
        }
    }
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(imdbId: "")
    }
}
