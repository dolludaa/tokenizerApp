//
//  TokenizerViewController.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import UIKit

class TokenizerViewController: UIViewController, TokenizerViewProtocolDelegate {

  private let tokenizer: TokenizerProtocol
  private let languageDetector: LanguageDetectorProtocol
  private let tokenizerView: TokenizerViewProtocol

  init(tokenizer: TokenizerProtocol, languageDetector: LanguageDetectorProtocol, tokenizerView: TokenizerViewProtocol) {
    self.tokenizer = tokenizer
    self.languageDetector = languageDetector
    self.tokenizerView = tokenizerView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tokenizerView.didLoad()
    setLanguageText(language: nil)
  }

  override func loadView() {
    view = tokenizerView
  }

  func assignDelegate(input: UITextView) {
    input.delegate = self
  }

  private func setLanguageText(language: Language?) {
    if let language {
      tokenizerView.setLanguage(text: "Language: \(language.rawValue)")
    } else {
      tokenizerView.setLanguage(text: "Language is not detected")
    }
  }

  private func tokenizeText(language: Language?) {
    guard let language = languageDetector.detectLanguage(for: tokenizerView.inputText)
    else {
      tokenizerView.outputText = ""
      return
    }

    let tokenizedText = tokenizer.tokenize(
      text: tokenizerView.inputText,
      language: language
    )

    tokenizerView.outputText = tokenizedText
  }
}

extension TokenizerViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    let language = languageDetector.detectLanguage(for: tokenizerView.inputText)
    tokenizeText(language: language)
    setLanguageText(language: language)
  }
}


