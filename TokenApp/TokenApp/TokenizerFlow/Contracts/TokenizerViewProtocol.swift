//
//  TokenizerViewProtocol.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import Foundation
import UIKit

protocol TokenizerViewProtocol: UIView {
  var inputText: String { get }
  var outputText: String { get set }
  func didLoad()
  func setLanguage(text: String)
}
