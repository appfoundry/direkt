//
//  AppDelegate.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit
@_exported import Direkt

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var guiCreatable: GUICreatable?

    private let factory: Factory = SwinjectFactory()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        setupGUI()

        return true
    }

    private func setupGUI() {
        guiCreatable = self.factory.guiCreatable
        self.window = guiCreatable?.createWindow(viewControllerFactory: self.factory)
        self.window?.makeKeyAndVisible()
    }
}
