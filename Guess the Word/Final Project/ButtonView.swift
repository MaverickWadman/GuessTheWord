//
//  EasyView.swift
//  Final Project
//
//  Created by Maverick Wadman on 5/9/24.
//

import SwiftUI

struct ButtonView: View {
    //trackers for how many letters user guesses correctly
    @State private var numWrong: Int = 0
    @State private var numRight: Int = 0
    
    //creation of hangman
    let figure = Figure()
    
    //user input and storage of word used for guessing
    @StateObject private var inputCharacter = TextFieldFormatter()
    @State private var wordToGuess: String = ""
    @State private var guessedWord: String = ""
    let setIndex: WordType
    
    init(setIndex: WordType) {
        self.setIndex = setIndex
        _wordToGuess = State(initialValue: setIndex.set[Int.random(in: 0..<setIndex.set.count)])
        _guessedWord = State(initialValue: String(repeating: "_", count: wordToGuess.count))
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                //draws hangman based on how many wrong guesses are made
                ZStack {
                    figure.staffBase()
                    if numWrong >= 1 {
                        figure.createHead()
                    }
                    if numWrong >= 2 {
                        figure.createBody()
                    }
                    if numWrong >= 3 {
                        figure.createRightArm()
                    }
                    if numWrong >= 4 {
                        figure.createLeftArm()
                    }
                    if numWrong >= 5 {
                        figure.createRightLeg()
                    }
                    if numWrong >= 6 {
                        figure.createLeftLeg()
                    }
                }
                .offset(y: -100)
                
                //displays placeholders for letters in word
                HStack {
                    ForEach(Array(guessedWord.enumerated()), id: \.offset) { index, letter in
                        ZStack {
                            Rectangle()
                                .frame(width: 50.0, height: 50.0)
                                .foregroundColor(.gray)
                            Text(String(letter))
                                .font(.custom("San Francisco", size: 50))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                //Text field and button used for user input
                TextField("Enter a Letter", text: $inputCharacter.text)
                    .frame(width: 200)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.orange)
                        .frame(width: 200, height: 50)
                        .padding()
                    Button(action: {
                        guard let guessedChar = inputCharacter.text.first else { return }
                        checkGuessedLetter(guessedChar)
                        self.inputCharacter.text = ""
                    }) {
                        Spacer()
                        Text("Guess")
                        Spacer()
                    }
                    .frame(width: 200, height: 50)
                    .contentShape(Rectangle())
                }
            }
            
            if numRight == wordToGuess.count{
                winScreen()
            }
            if numWrong == 6 {
                loseScreen()
            }
        }
    }
    
    //checked if letter appears in hidden word
    private func checkGuessedLetter(_ guessedChar: Character) {
        var updatedGuessedWord = guessedWord
        let hitChecker = numRight
        
        for (index, char) in wordToGuess.enumerated() {
            if char == guessedChar {
                updatedGuessedWord = String(updatedGuessedWord.prefix(index) + String(char) + updatedGuessedWord.suffix(updatedGuessedWord.count - index - 1))
                numRight += 1
            }
        }
        if hitChecker == numRight {
            numWrong += 1
        }
        
        
        guessedWord = updatedGuessedWord
    }
    
    private func winScreen() -> some View{
        ZStack {
            Rectangle()
                .foregroundColor(.green)
            VStack {
                Text("You Found the Word!")
                    .font(.system(size: 40, weight: .bold))
                Text("Go back and try the other difficulties")
            }

        }
    }
    
    private func loseScreen() -> some View{
        ZStack {
            Rectangle()
                .foregroundColor(.red)
            VStack {
                Text("Game Over")
                    .font(.system(size: 40, weight: .bold))
                Text("Go back and try the other difficulties")
            }

        }
    }
    
    
}

//used for what can be entered in text field
class TextFieldFormatter: ObservableObject {
    @Published var text: String = ""

    func filterText(_ text: String) -> String {
        return text.filter { $0.isLetter } // Allow only letters
    }
}

#Preview {
    ButtonView(setIndex: wordData[0])
}


