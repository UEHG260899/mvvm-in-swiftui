//
//  AddWeatherViewModel.swift
//  Weather
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    @Published var city = ""
    
    func save(completion: @escaping (WeatherViewModel) -> Void) {
        Webservice().getWeatherByCity(city: city) { [weak self] result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherViewModel(weather: weather))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
