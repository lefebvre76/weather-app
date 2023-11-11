//
//  WeatherViewModel.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published public var progressBarValue: CGFloat = 0.0
    @Published public var message: String = ""
    @Published public var weathers: [String: WeatherResult] = [:]
    @MainActor @Published public var loadWeatherInProgress = false
    @MainActor @Published public var showError = false

    // Progress Bar
    private var progressBarTimer: Timer?
    private let progressBarTimeInterval: Double = (60/100)
    private var progressBarProgressionValue = CGFloat(0.01)
    private var progressBarProgressionMaxValue = CGFloat(1)
    
    // Messages
    private var messagesTimer: Timer?
    private let messagesTimeInterval: Double = 6
    private var currentMessageIndex = 0
    private var messages = [
        "messages.0", "messages.1", "messages.2"
    ]
    
    // Weather
    private var weatherTimer: Timer?
    private let weatherTimeInterval = 10.0
    private var cities = [
        "Rennes", "Paris", "Nantes", "Bordeaux", "Lyon"
    ]
    private var currentCityIndex = 0
    
    
    public func launchTimers() {
        progressBarValue = 0
        progressBarTimer = Timer.scheduledTimer(timeInterval: self.progressBarTimeInterval,
                                                target: self,
                                                selector: #selector(updateProgressBar),
                                                userInfo: nil,
                                                repeats: true)
        currentMessageIndex = 0
        updateMessage()
        messagesTimer = Timer.scheduledTimer(timeInterval: self.messagesTimeInterval,
                                             target: self,
                                             selector: #selector(updateMessage),
                                             userInfo: nil,
                                             repeats: true)
        currentCityIndex = 0
        weathers = [:]
        weatherTimer = Timer.scheduledTimer(timeInterval: self.weatherTimeInterval,
                                            target: self,
                                            selector: #selector(loadData),
                                            userInfo: nil,
                                            repeats: true)
        loadData()
    }
    
    public func stopTimers() {
        if let progressBarTimer = self.progressBarTimer {
            progressBarTimer.invalidate()
        }
        if let messagesTimer = self.messagesTimer {
            messagesTimer.invalidate()
        }
        if let weatherTimer = self.weatherTimer {
            weatherTimer.invalidate()
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
    
    @objc private func updateMessage() {
        message = messages[currentMessageIndex].localized()
        if currentMessageIndex < messages.count - 1 {
            currentMessageIndex += 1
        } else {
            currentMessageIndex = 0
        }
    }

    @objc private func loadData() {
        Task {
            await loadWeather()
        }
    }
    
    private func loadWeather() async {
        await MainActor.run {
            self.showError = false
        }
        if currentCityIndex < cities.count {
            await MainActor.run {
                self.loadWeatherInProgress = true
            }
            if let result = await WeatherApiService.show(city: cities[currentCityIndex]) {
                switch(result) {
                case let .success(data):
                    await MainActor.run {
                        self.weathers[cities[currentCityIndex]] = data
                    }
                default:
                    await MainActor.run {
                        self.showError = true
                    }
                }
            } else {
                await MainActor.run {
                    self.showError = true
                }
            }
            await MainActor.run {
                self.loadWeatherInProgress = false
            }
            currentCityIndex += 1
        } else {
            guard let weatherTimer = self.weatherTimer else { return }
            weatherTimer.invalidate()
        }
    }
}
