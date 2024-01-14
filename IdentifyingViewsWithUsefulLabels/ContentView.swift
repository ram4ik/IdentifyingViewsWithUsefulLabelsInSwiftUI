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
    @State private var value = 10
    
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
            
            VStack {
                Text("Value: \(value)")
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Button("Increment") {
                        value += 1
                    }.padding()
                    
                    Button("Decrement") {
                        value -= 1
                    }.padding()
                }
            }
            .accessibilityElement()
            .accessibilityLabel("Value")
            .accessibilityValue(String(value))
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    value += 1
                case .decrement:
                    value -= 1
                default:
                    print("Not handled")
                }
            }
        }
        .accessibilityElement(children: .ignore) // Children will be ignored
        .accessibilityLabel("This is a button for switch animal pictures")
    }
}

#Preview {
    ContentView()
}
