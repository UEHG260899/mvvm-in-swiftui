//
//  Store.swift
//  Weather
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

class Store: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .kelvin
    @Published var weatherList = [WeatherViewModel]()
    
    init() {
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    
}
