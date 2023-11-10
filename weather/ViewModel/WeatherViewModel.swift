//
//  WeatherViewModel.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published public var progressBarValue: CGFloat = 0.0

    private var progressBarTimer: Timer?
    private let progressBarTimeInterval: Double = (60/100)
    private var progressBarProgressionValue = CGFloat(0.01)
    private var progressBarProgressionMaxValue = CGFloat(1)
    
    public func launchTimers() {
        progressBarValue = 0
        progressBarTimer = Timer.scheduledTimer(timeInterval: self.progressBarTimeInterval,
                                     target: self,
                                     selector: #selector(updateProgressBar),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    public func stopTimers() {
        if let progressBarTimer = self.progressBarTimer {
            progressBarTimer.invalidate()
        }
    }
    
    @objc private func updateProgressBar() {
        if progressBarValue < progressBarProgressionMaxValue {
            progressBarValue += progressBarProgressionValue
        } else {
            guard let progressBarTimer = self.progressBarTimer else { return }
            progressBarTimer.invalidate()
        }
    }
}
