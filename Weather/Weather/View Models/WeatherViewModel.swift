//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

struct WeatherViewModel: Identifiable {
    let weather: Weather
    
    let id = UUID()
    
    var temperature: Double {
        weather.temperature
    }
    
    var city: String {
        weather.city
    }
    
    var icon: String {
        weather.icon
    }
    
    var sunrise: Date {
        weather.sunrise
    }
    
    var sunset: Date {
        weather.sunset
    }
    
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
        switch unit {
        case .celsius:
            return weather.temperature - 273.15
        case .fahrenheit:
            return 1.8 * (weather.temperature - 273) + 32
        case .kelvin:
            return weather.temperature
        }
    }
}
