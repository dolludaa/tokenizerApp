//
//  LanguageDetectorProtocol.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation

protocol LanguageDetectorProtocol {
  func detectLanguage(for text: String) -> Language?
}
