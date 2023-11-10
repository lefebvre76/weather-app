//
//  WeatherView.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation
import SwiftUI

struct ProgressBarView: View {
    let progressValue: CGFloat
    var height: Int = 25

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: CGFloat(height/2), style: .continuous)
                        .fill(.primary)
                        .frame(width: geometry.size.width, height: CGFloat(height))
                        .opacity(0.5)
                        .foregroundColor(Color.primaryColor())
                    RoundedRectangle(cornerRadius: CGFloat(height/2), style: .continuous)
                        .fill(.primary)
                        .frame(
                            width: min(progressValue * geometry.size.width,
                                       geometry.size.width),
                            height: CGFloat(height)
                        )
                        .foregroundColor(Color.primaryColor())
                }
            }
            Text("\(String(format: "%.f", Double(progressValue * 100))) %")
                .foregroundStyle(.white)
                .bold().fixedSize(horizontal: false, vertical: true)
        }.frame(height: CGFloat(height))
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

