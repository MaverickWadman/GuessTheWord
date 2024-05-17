//
//  MainScreen.swift
//  Final Project
//
//  Created by Maverick Wadman on 5/9/24.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                //Title
                Text("Welcome to Guess the Word")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Select a difficulty to start")
                    .font(.caption)
                //Easy button
                NavigationButton(destination: ButtonView(setIndex: wordData[0]), color: .green, name: "Easy")
                //Medium button
                NavigationButton(destination: ButtonView(setIndex: wordData[1]), color: .yellow, name: "Medium")
                //Difficult button
                NavigationButton(destination: ButtonView(setIndex: wordData[2]), color: .red, name: "Difficult")
            }
        }
    }
}

//struct for buttons
struct NavigationButton<Destination: View>: View {
    let destination: Destination
    let color: Color
    let name: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 200.0, height: 50.0)
                .foregroundColor(color)
                .overlay(
                    Text(name)
                        .foregroundColor(.black)
                )
            
        }
    }
}

#Preview {
    MainScreen()
}
