//
//  WeatherApp.swift
//  Weather
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherListScreen()
                .environmentObject(Store())
        }
    }
}
