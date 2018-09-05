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

    private let resolver: Direkt.Resolver = SwinjectResolver()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        setupGUI()

        return true
    }

    private func setupGUI() {
        guiCreatable = try! self.resolver.resolve(GUICreatable.self)
        self.window = guiCreatable?.createWindow(resolver: self.resolver)
        self.window?.makeKeyAndVisible()
    }
}
