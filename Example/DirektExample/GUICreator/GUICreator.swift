//
//  GUICreator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

final class GUICreator: GUICreatable {

    func createWindow(viewControllerFactory: ViewControllerFactory) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let controller = try! viewControllerFactory.makeViewController(ofType: MainViewController.self)

        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController

        return window
    }
}
