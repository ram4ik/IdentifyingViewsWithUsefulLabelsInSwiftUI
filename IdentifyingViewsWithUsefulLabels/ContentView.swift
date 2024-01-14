//
//  ContentView.swift
//  IdentifyingViewsWithUsefulLabels
//
//  Created by test on 14.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    let pictures = [
        "tortoise",
        "bird",
        "cat",
        "lizard"
    ]
    
    let labels = [
        "Picture of tortoise",
        "Picture of bird",
        "Picture of cat",
        "Picture of lizard"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        VStack {
            Button {
                selectedPicture = Int.random(in: 0...3)
            } label: {
                Image(systemName: pictures[selectedPicture])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.mint)
                    .accessibilityHidden(true) // Hidden from accessibility
            }
            .accessibilityLabel(labels[selectedPicture])
        }
        .accessibilityElement(children: .ignore) // Children will be ignored
        .accessibilityLabel("This is a button for switch animal pictures")
    }
}

#Preview {
    ContentView()
}
