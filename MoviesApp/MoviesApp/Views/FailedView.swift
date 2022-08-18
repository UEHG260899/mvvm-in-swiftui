//
//  FailedView.swift
//  MoviesApp
//
//  Created by Uriel Hernandez Gonzalez on 17/08/22.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        Text("Whoops, no results for that query")
            .padding()
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
