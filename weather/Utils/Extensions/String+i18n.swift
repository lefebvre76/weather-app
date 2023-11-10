//
//  String+i18n.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation

extension String {
    func localized(arguments: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments)
    }
}
