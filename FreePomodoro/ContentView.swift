//
//  ContentView.swift
//  FreePomodoro
//
//  Created by Reddy Tintaya Conde on 11/8/

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                counter += 1
            }) {
                Text("Increment")
                    .font(.title)
                    .padding()
            }
        }
        .frame(width: 200, height: 150) // Adjust the frame size as needed
    }
}

#Preview {
    ContentView()
}
