//
//  NonEditableTextView.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-08.
//

import UIKit

class NonEditableTextView: UITextView {
  override var canBecomeFirstResponder: Bool {
    false
  }
}
