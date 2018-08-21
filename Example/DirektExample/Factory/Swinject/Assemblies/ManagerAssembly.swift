//
//  ManagerAssembly.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject

final class ManagerAssembly: Assembly {

    let factory: ViewControllerFactory & NavigatorFactory

    init(factory: ViewControllerFactory & NavigatorFactory) {
        self.factory = factory
    }

    func assemble(container: Swinject.Container) {
        container.register(NavigationManager.self) { [factory] _ in
            BaseNavigationManager(viewControllerFactory: factory, navigatorFactory: factory)
        }.inObjectScope(.container)
    }
}
