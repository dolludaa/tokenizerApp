//
//  ViewController.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import UIKit
import NaturalLanguage

protocol TokenizerViewProtocol {

}

class TokenizerView: UIViewController, UITextViewDelegate {

  let inputTextView = UITextView()
  let outputTextView = UITextView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayout()
    setUpStyle()
    inputTextView.delegate = self
  }

  func textViewDidChange(_ textView: UITextView) {
    tokenizeText()
  }

  private func setUpLayout() {

    inputTextView.translatesAutoresizingMaskIntoConstraints = false
    outputTextView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(inputTextView)
    view.addSubview(outputTextView)

    NSLayoutConstraint.activate([
      inputTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      inputTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      inputTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      inputTextView.heightAnchor.constraint(equalToConstant: 150),

      outputTextView.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20),
      outputTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      outputTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      outputTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }

  private func setUpStyle() {
    view.backgroundColor = .white

    inputTextView.layer.borderColor = UIColor.gray.cgColor
    inputTextView.layer.borderWidth = 1.0

    outputTextView.layer.borderColor = UIColor.gray.cgColor
    outputTextView.layer.borderWidth = 1.0
    outputTextView.isEditable = false
  }

  private func tokenizeText() {
    guard detectLanguage(for: inputTextView.text) != nil else { return }
    let tokenizer = Tokenizer()
    let tokenizedText = tokenizer.tokenize(text: inputTextView.text, language: inputTextView.text)
    outputTextView.text = tokenizedText.joined(separator: "\n")
  }

  private func detectLanguage(for text: String) -> String? {
    let languageRecognizer = NLLanguageRecognizer()
    languageRecognizer.processString(text)
    guard let languageCode = languageRecognizer.dominantLanguage?.rawValue else { return nil }
    return languageCode == "en" ? "English" : (languageCode == "es" ? "Spanish" : nil)
  }
}


#Preview {
  TokenizerView()
}
