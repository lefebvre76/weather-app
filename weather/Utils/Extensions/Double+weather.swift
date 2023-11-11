//
//  Double+weather.swift
//  weather
//
//  Created by Loïc Levebvre on 11/11/2023.
//

import Foundation

import Foundation

extension Double {
    func temperature(unit: UnitTemperature = UnitTemperature.kelvin) -> String {
        let formatter = MeasurementFormatter()
        let measurement = Measurement(value: self, unit: unit)
        return formatter.string(from: measurement)
    }
}
