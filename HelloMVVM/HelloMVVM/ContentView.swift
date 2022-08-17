//
//  ContentView.swift
//  HelloMVVM
//
//  Created by Uriel Hernandez Gonzalez on 16/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CounterViewModel()
    
    var premiumText: String {
        (viewModel.isPremium) ? "PREMIUM" : ""
    }
    
    var body: some View {
        VStack {
            Text(premiumText)
                .foregroundColor(.green)
                .frame(width: 200, height: 100)
                .font(.largeTitle)
            Text("\(viewModel.value)")
                .font(.title)
            Button("Increment") {
                self.viewModel.increment()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
