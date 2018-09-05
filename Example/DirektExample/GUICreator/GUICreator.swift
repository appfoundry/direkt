//
//  GUICreator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

final class GUICreator: GUICreatable {

    func createWindow(resolver: Direkt.Resolver) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let controller = try! resolver.resolve(MainViewController.self)

        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController

        return window
    }
}
