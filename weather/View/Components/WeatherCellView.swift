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
        ProgressBarView(progressValue: 0.0)
        ProgressBarView(progressValue: 0.5, height: 50)
        ProgressBarView(progressValue: 1)
    }
}

#Preview {
    VStack(alignment: .leading) {
        ProgressBarView(progressValue: 0.0).preferredColorScheme(.dark)
        ProgressBarView(progressValue: 0.5, height: 50).preferredColorScheme(.dark)
        ProgressBarView(progressValue: 1).preferredColorScheme(.dark)
    }
}
