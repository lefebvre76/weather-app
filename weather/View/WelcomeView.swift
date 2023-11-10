//
//  ContentView.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("welcome.message".localized()).multilineTextAlignment(.center).padding(.bottom)
                NavigationLink(destination: WeatherView()) {
                    Text("common.buttons.next".localized())
                    Image(systemName: "chevron.right")
                }.padding()
                    .background(Color.primaryColor())
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}

#Preview {
    WelcomeView().preferredColorScheme(.dark)
}
