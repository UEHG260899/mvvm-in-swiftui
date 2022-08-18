//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import SwiftUI


extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
