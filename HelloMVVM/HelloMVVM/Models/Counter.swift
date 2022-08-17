//
//  Counter.swift
//  HelloMVVM
//
//  Created by Uriel Hernandez Gonzalez on 16/08/22.
//

import Foundation

struct Counter {
    var value: Int = 0
    var isPremium: Bool = false
    
    mutating func increment() {
        value += 1
        
        if value.isMultiple(of: 3) {
            isPremium = true
            return
        }
        
        isPremium = false
    }
}
