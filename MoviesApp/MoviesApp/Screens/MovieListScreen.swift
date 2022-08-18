//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var viewModel: MovieListViewModel
    
    init() {
        self.viewModel = MovieListViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Search", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .onSubmit {
                        self.viewModel.searchByName(self.viewModel.searchQuery)
                    }
                
                Spacer()
                
                if viewModel.loadingState == .success {
                    MovieListView(movies: viewModel.movies)
                        
                } else if viewModel.loadingState == .failed {
                    FailedView()
                    Spacer()
                }

            }
            .navigationTitle("Movies")
        }
//        .embedInNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
