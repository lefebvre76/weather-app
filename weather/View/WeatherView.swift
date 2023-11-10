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
            ProgressBarView(progressValue: viewModel.progressBarValue)
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
