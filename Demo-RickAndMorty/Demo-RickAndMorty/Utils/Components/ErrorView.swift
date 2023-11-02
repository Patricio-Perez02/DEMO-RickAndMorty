//
//  ErrorView.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 01/11/2023.
//

import SwiftUI

struct ErrorView: View {
    let messages: String
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 150)
            
            LottieView(name: "ErrorAnimation")
                .frame(width: 150, height: 150)
            
            Text(messages)
                .font(.system(size: 17, weight: .semibold, design: .default))
                .tint(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
    }
}

#Preview {
    ErrorView(messages: "Internal server.")
}
