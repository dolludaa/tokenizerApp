//
//  Tokenizer.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import Foundation

import Foundation

class Tokenizer {
  func tokenize(text: String, language: String) -> [String] {
    var sentences = [String]()
    let tokens = text.components(separatedBy: .whitespacesAndNewlines)

    let keywords = language.lowercased() == "spanish" ? ["si", "y"] : ["if", "and"]

    var currentSentence = ""
    for token in tokens {
      if keywords.contains(token.lowercased()) {
        if !currentSentence.isEmpty {
          sentences.append(currentSentence.trimmingCharacters(in: .whitespaces))
          currentSentence = ""
        }
        currentSentence += token + " "
      } else {
        currentSentence += token + " "
      }
    }

    if !currentSentence.isEmpty {
      sentences.append(currentSentence.trimmingCharacters(in: .whitespaces))
    }

    return sentences
  }
}

