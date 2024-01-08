//
//  TokenizerView.swift
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
  let mainView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayout()
    setUpStyle()
  }

  func textViewDidChange(_ textView: UITextView) {
    tokenizeText()
  }

  private func setUpLayout() {

    mainView.translatesAutoresizingMaskIntoConstraints = false
    inputTextView.translatesAutoresizingMaskIntoConstraints = false
    outputTextView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(mainView)
    mainView.addSubview(inputTextView)
    mainView.addSubview(outputTextView)

    NSLayoutConstraint.activate([
      mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      inputTextView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
      inputTextView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
      inputTextView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      inputTextView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),

      outputTextView.topAnchor.constraint(equalTo: inputTextView.bottomAnchor),
      outputTextView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
      outputTextView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
      outputTextView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -20),

    ])
  }

  private func setUpStyle() {
    view.backgroundColor = UIColor.systemBackground

    mainView.backgroundColor = .lightGray

    inputTextView.delegate = self
    inputTextView.layer.cornerRadius = 8
    inputTextView.backgroundColor = .blue
    inputTextView.layer.borderWidth = 1.0
    inputTextView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    inputTextView.textColor = .black

    outputTextView.layer.cornerRadius = 8
    outputTextView.layer.borderColor = UIColor.systemGray4.cgColor
    outputTextView.layer.borderWidth = 1.0
    outputTextView.isEditable = false
    outputTextView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    outputTextView.textColor = AppColorEnum.outputText.color
  }


  @objc private func tokenizeText() {
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
