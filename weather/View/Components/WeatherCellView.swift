//
//  WeatherCellView.swift
//  weather
//
//  Created by Loïc Levebvre on 11/11/2023.
//

import Foundation
import SwiftUI

struct WeatherCellView: View {
    var item: WeatherResult

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(item.city ?? "")").font(.title)
                HStack {
                    Text("\(item.main.temp_min.temperature())").font(.caption).foregroundStyle(.temperatureMin)
                    Text("\(item.main.temp_max.temperature())").font(.caption).foregroundStyle(.temperatureMax)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                HStack {
                    Text("\(item.main.temp.temperature())")
                    Image(systemName: item.getIcon()).font(.title)
                }
                Text("\(item.weather.first?.description ?? "")").font(.caption)
            }
        }.padding(.vertical, 5)
    }
}


#Preview {
    VStack(alignment: .leading) {
        WeatherCellView(item: WeatherResult(weather: Weather(id: 500, main: "Rain", description: "légère pluie", icon: "10d"), main: Main(temp: 282.01, feels_like: 279.26, temp_min: 281.14, temp_max: 282.92, pressure: 1010, humidity: 50), city: "Paris"))
    }
}

#Preview {
    VStack(alignment: .leading) {
        WeatherCellView(item: WeatherResult(weather: Weather(id: 500, main: "Rain", description: "légère pluie", icon: "10d"), main: Main(temp: 282.01, feels_like: 279.26, temp_min: 281.14, temp_max: 282.92, pressure: 1010, humidity: 50), city: "Paris")).preferredColorScheme(.dark)
    }
}
