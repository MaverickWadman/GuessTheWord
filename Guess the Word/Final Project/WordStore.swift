//
//  WordStore.swift
//  Final Project
//
//  Created by Maverick Wadman on 5/11/24.
//

import Foundation
import SwiftUI
import Combine

class WordStore: ObservableObject {
    @Published var words: [WordType]
    
    init(words: [WordType]) {
        self.words = words
    }
}
