//
//  ViewControllerAssembly.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class ViewControllerAssembly: Assembly {

    func assemble(container: Swinject.Container) {
        container.register(MainViewController.self) { resolver in
            let controller = MainViewController(style: .plain)
            resolver.resolve(\.navigationManager, in: controller)
            return controller
        }.inObjectScope(.transient)

        container.register(HelloViewController.self) { (resolver, input: String) in
            let controller = HelloViewController()
            resolver.resolve(\.navigationManager, in: controller)
            controller.text = input
            return controller
        }.inObjectScope(.transient)

        container.register(InTabViewController.self) { resolver in
            let controller = InTabViewController()
            resolver.resolve(\.navigationManager, in: controller)
            return controller
        }.inObjectScope(.transient)

        container.register(ModalViewController.self) { resolver in
            let controller = ModalViewController()
            resolver.resolve(\.navigationManager, in: controller)
            return controller
        }.inObjectScope(.transient)
    }
}
