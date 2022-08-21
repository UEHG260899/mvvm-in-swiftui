//
//  WeatherListScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/5/21.
//

import SwiftUI

enum Sheets: Identifiable {
    var id: UUID {
        UUID()
    }
    case addNewCity
    case settings
}

struct WeatherListScreen: View {
    
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(store.weatherList) { weatherElement in
                    WeatherCell(weather: weatherElement)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .sheet(item: $activeSheet, content: { activeSheet in
                switch activeSheet {
                case .addNewCity:
                    AddCityScreen()
                case .settings:
                    SettingsScreen()
                }
            })
            .navigationBarItems(leading: Button(action: {
                activeSheet = .settings
            }) {
                Image(systemName: "gearshape")
            }, trailing: Button(action: {
                activeSheet = .addNewCity
            }, label: {
                Image(systemName: "plus")
            }))
            .navigationTitle("Cities")
        }
        
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        return WeatherListScreen()
    }
}

struct WeatherCell: View {
    
    @EnvironmentObject private var store: Store
    let weather: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            
            AsyncImage(url: URL(string: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon)))
            
            Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit))) \(String(store.selectedUnit.displayText.prefix(1)))")
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        
    }
}
