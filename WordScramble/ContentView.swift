//
//  ContentView.swift
//  WordScramble
//
//  Created by Владислав on 17.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWord = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWord, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
            
        withAnimation {
            usedWord.insert(answer, at: 0)
        }
        newWord = ""
    }
}

#Preview {
    ContentView()
}
