//
//  Test.swift
//  Final Project
//
//  Created by Maverick Wadman on 5/12/24.
//

import SwiftUI

struct Test: View {
    let secretWord = "SWIFT"
        @State private var guessedLetters: [Character?] = Array(repeating: nil, count: "SWIFT".count)
        @State private var userInput = ""
        
        var body: some View {
            VStack {
                Text("Guess the Word")
                    .font(.title)
                    .padding()
                
                HStack(spacing: 10) {
                    ForEach(0..<secretWord.count) { index in
                        Text(guessedLetters[index] != nil ? String(guessedLetters[index]!) : "_")
                            .font(.largeTitle)
                            .padding()
                    }
                }
                
                TextField("Enter a letter", text: $userInput, onCommit: processInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
        }
        
        func processInput() {
            guard let letter = userInput.uppercased().first else { return }
            guard !guessedLetters.contains(letter) else {
                // Handle if letter already guessed
                return
            }
            
            var newGuessedLetters = guessedLetters
            for (index, char) in secretWord.enumerated() {
                if char == letter {
                    newGuessedLetters[index] = letter
                }
            }
            guessedLetters = newGuessedLetters
            
            userInput = "" // Clear the text field
        }
}

#Preview {
    Test()
}
