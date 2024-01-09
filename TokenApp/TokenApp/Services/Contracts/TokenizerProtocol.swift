//
//  TokenizerProtocol.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation

protocol TokenizerProtocol {
  func tokenize(text: String, language: Language) -> String
}
