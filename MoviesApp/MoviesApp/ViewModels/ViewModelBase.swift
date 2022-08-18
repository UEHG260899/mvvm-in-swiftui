//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import Foundation

enum LoadingState {
    case success
    case loading
    case failed
    case none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
