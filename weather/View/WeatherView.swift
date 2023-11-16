//
//  WeatherView.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @ObservedObject private var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.weathers, id: \.city) { weather in
                WeatherCellView(item: weather)
            }
            if (viewModel.loadWeatherInProgress) {
                LoadView(city: viewModel.currentCity)
            }
            if (viewModel.showError) {
                Text("error")
            }
            Spacer()
            if  viewModel.progressBarValue < 1 {
                Text(viewModel.message)
                    .padding()
                    .multilineTextAlignment(.center)
                    .onDisappear {
                        viewModel.stopMessageTimer()
                    }
                ProgressBarView(progressValue: viewModel.progressBarValue)
            } else {
                Button("common.buttons.restart".localized()) {
                    viewModel.stopTimers()
                    viewModel.launchTimers()
                }.padding()
                .background(Color.primaryColor())
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            viewModel.launchTimers()
        }
        .onDisappear {
            viewModel.stopTimers()
        }
    }
}

#Preview {
    WeatherView()
}
