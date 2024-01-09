//
//  Language.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation

enum Language: String {
  case english
  case spanish

  init?(code: String) {
    switch code {
    case "en":
      self = .english
    case "es":
      self = .spanish
    default:
      return nil
    }
  }
}
