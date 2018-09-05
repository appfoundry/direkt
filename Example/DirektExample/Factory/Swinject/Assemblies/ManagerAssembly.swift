//
//  ManagerAssembly.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject

final class ManagerAssembly: Assembly {

    let resolver: Direkt.Resolver

    init(resolver: Direkt.Resolver) {
        self.resolver = resolver
    }

    func assemble(container: Swinject.Container) {
        container.register(NavigationManager.self) { [resolver] _ in
            BaseNavigationManager(resolver: resolver)
        }.inObjectScope(.container)
    }
}
