//
//  AppColorEnum.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import Foundation
import UIKit

enum AppColorEnum {
  case outputText
  case inputText
  case background

  var color: UIColor {
    switch self {
    case .outputText:
      UIColor(hex: 0x6FAFC2)
    case .inputText:
      UIColor(hex: 0xDEDEDE)
    case .background:
      UIColor(hex: 0xf3f2f9)
    }
  }
}
