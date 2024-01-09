//
//  Tokenizer.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import Foundation

class Tokenizer: TokenizerProtocol {

  func tokenize(text: String, language: Language) -> String {
    var sentences = [String]()
    let tokens = text.components(separatedBy: .whitespacesAndNewlines)
    let keywords = getKeywords(for: language)

    var currentSentence = ""

    for token in tokens {
      if keywords.contains(token.lowercased()),
         !currentSentence.isEmpty {
        sentences.append(currentSentence.trimmingCharacters(in: .whitespaces))
        currentSentence = ""
      }

      currentSentence += token + " "
    }

    if !currentSentence.isEmpty {
      sentences.append(currentSentence.trimmingCharacters(in: .whitespaces))
    }

    return sentences.joined(separator: "\n")
  }

  private func getKeywords(for language: Language) -> [String] {
    switch language {
    case .english:
      ["if", "and"]
    case .spanish:
      ["si", "y"]
    }
  }
}
