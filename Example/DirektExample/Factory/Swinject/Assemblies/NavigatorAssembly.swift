//
//  NavigatorAssembly.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject

class NavigatorAssembly: Assembly {

    let resolver: Direkt.Resolver

    init(resolver: Direkt.Resolver) {
        self.resolver = resolver
    }

    func assemble(container: Container) {
        container.register(factory: DismissingNavigator.init)
        container.register(factory: HelloViewControllerNavigator.init)
        container.register(factory: TabBarControllerNavigator.init)
        container.register(factory: ModalViewControllerNavigator.init)
    }
}
