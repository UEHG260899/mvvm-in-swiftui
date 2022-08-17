//
//  CounterViewModel.swift
//  HelloMVVM
//
//  Created by Uriel Hernandez Gonzalez on 16/08/22.
//

import Foundation

class CounterViewModel: ObservableObject {
    
    @Published private var counter = Counter()
    
    var value: Int {
        counter.value
    }
    
    var isPremium: Bool {
        counter.isPremium
    }
    
    func increment() {
        counter.increment()
    }
}
