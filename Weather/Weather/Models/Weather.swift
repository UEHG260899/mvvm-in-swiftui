//
//  Weather.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/8/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case name
        case weather = "main"
        case icon = "weather"
        case sys
    }
    
    private enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        icon = try container.decode([WeatherIcon].self, forKey: .icon)
        sys = try container.decode(Sys.self, forKey: .sys)
        name = try container.decode(String.self, forKey: .name)
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
    }
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunrise: Date
    let sunset: Date
}

struct WeatherIcon: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct Sys: Decodable {
    let sunrise: Date
    let sunset: Date
    
    
    private enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunriseTimeInterval = try container.decode(TimeInterval.self, forKey: .sunrise)
        let sunsetTimeInterval = try container.decode(TimeInterval.self, forKey: .sunset)
        sunrise = Date(timeIntervalSince1970: sunriseTimeInterval)
        sunset = Date(timeIntervalSince1970: sunsetTimeInterval)
    }
}
