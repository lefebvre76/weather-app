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
    }
    
    public func stopTimers() {
        if let progressBarTimer = self.progressBarTimer {
            progressBarTimer.invalidate()
        }
        if let messagesTimer = self.messagesTimer {
            messagesTimer.invalidate()
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
}
