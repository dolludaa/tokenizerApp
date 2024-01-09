//
//  TokenizerView.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation
import UIKit

class TokenizerView: UIView {

  weak var delegate: TokenizerViewProtocolDelegate?

  private let inputTextView = UITextView()
  private let outputTextView = NonEditableTextView()
  private let containerView = UIView()
  private let dividerView = UIView()
  private let languageLabel = UILabel()

  private func setUpLayout() {

    containerView.translatesAutoresizingMaskIntoConstraints = false
    languageLabel.translatesAutoresizingMaskIntoConstraints = false
    inputTextView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    outputTextView.translatesAutoresizingMaskIntoConstraints = false

    addSubview(containerView)
    containerView.addSubview(languageLabel)
    containerView.addSubview(inputTextView)
    containerView.addSubview(dividerView)
    containerView.addSubview(outputTextView)

    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      containerView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),

      languageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
      languageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      languageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

      inputTextView.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 20),
      inputTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      inputTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      inputTextView.heightAnchor.constraint(equalTo: outputTextView.heightAnchor),

      dividerView.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 10),
      dividerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      dividerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      dividerView.heightAnchor.constraint(equalToConstant: 2),

      outputTextView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
      outputTextView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      outputTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      outputTextView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20),

    ])
  }

  private func setUpStyle() {
    backgroundColor = AppColorEnum.background.color

    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = 10

    languageLabel.textColor = .black
    languageLabel.font = .boldSystemFont(ofSize: 16)

    delegate?.assignDelegate(input: inputTextView)
    inputTextView.backgroundColor = .white
    inputTextView.font = .systemFont(ofSize: 20, weight: .bold)
    inputTextView.textColor = .black
    inputTextView.becomeFirstResponder()

    dividerView.backgroundColor = AppColorEnum.background.color
    dividerView.layer.cornerRadius = 2

    outputTextView.font = .systemFont(ofSize: 20, weight: .bold)
    outputTextView.textColor = AppColorEnum.outputText.color
    outputTextView.backgroundColor = .white
  }
}

extension TokenizerView: TokenizerViewProtocol {
  var outputText: String {
    get {
      outputTextView.text
    }
    set {
      outputTextView.text = newValue
    }
  }
  
  var inputText: String {
    inputTextView.text
  }
  
  func didLoad() {
    setUpLayout()
    setUpStyle()
  }

  func setLanguage(text: String) {
    languageLabel.text = text
  }
}


