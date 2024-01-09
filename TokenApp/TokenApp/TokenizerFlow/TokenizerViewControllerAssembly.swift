//
//  TokenizerViewControllerAssembly.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation
import UIKit

struct TokenizerViewControllerAssembly {
  func create() -> UIViewController {
    let tokenizer = Tokenizer()
    let languageDetector = LanguageDetector()
    let tokenizerView = TokenizerView()

    let controller = TokenizerViewController(tokenizer: tokenizer, languageDetector: languageDetector, tokenizerView: tokenizerView)

    tokenizerView.delegate = controller

    return controller
  }
}
