//
//  LoadView.swift
//  weather
//
//  Created by Loïc Levebvre on 16/11/2023.
//

import Foundation
import SwiftUI

struct LoadView: View {
    var city: String

    var body: some View {
        HStack {
            ProgressView().padding(.trailing, 5)
            Text("load.city_datas".localized(arguments: city)).font(.subheadline).foregroundStyle(.gray)
        }.padding(.vertical, 5)
    }
}


#Preview {
    VStack(alignment: .leading) {
        LoadView(city: "Paris")
    }
}

#Preview {
    VStack(alignment: .leading) {
        LoadView(city: "Paris").preferredColorScheme(.dark)
    }
}

