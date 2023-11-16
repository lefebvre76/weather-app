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
    var height: Int = 30

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                GeometryReader { geo in
                        Rectangle()
                            .fill(Color.primaryColor())
                            .frame(maxWidth: geo.size.width * progressValue)
                            .animation(.linear)
                    }
            }.background(Color.primaryColor())
                    .opacity(0.5)
                    .frame(height: CGFloat(height))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(CGFloat(height)/2)
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

