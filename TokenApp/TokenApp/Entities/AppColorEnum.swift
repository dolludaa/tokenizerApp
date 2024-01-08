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
  case inpitText

  var color: UIColor {
    switch self {
    case .outputText:
      return UIColor(hex: 0x6FAFC2)
    case .inpitText:
      return UIColor(hex: 0xDEDEDE)
    }
  }
}
