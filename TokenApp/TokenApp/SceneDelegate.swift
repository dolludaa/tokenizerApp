//
//  SceneDelegate.swift
//  TokenApp
//
//  Created by Людмила Долонтаева on 2024-01-07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene( _ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = (scene as? UIWindowScene) else { return }
      let tokenVC = TokenizerView()
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = tokenVC

      self.window = window
      window.makeKeyAndVisible()
    }
}

