//
//  LanguageDetector.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation
import NaturalLanguage

class LanguageDetector: LanguageDetectorProtocol {
  func detectLanguage(for text: String) -> Language? {
    let languageRecognizer = NLLanguageRecognizer()
    languageRecognizer.processString(text)
    guard let languageCode = languageRecognizer.dominantLanguage?.rawValue else { return nil }
    return Language(code: languageCode)
  }
}
