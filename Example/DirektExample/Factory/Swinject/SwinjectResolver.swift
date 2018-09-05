//
//  SwinjectResolver.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class SwinjectResolver: Direkt.Resolver {

    private var assembler: Assembler!

    init() {
        assembler = Assembler([
            ViewControllerAssembly(),
            NavigatorAssembly(resolver: self),
            ManagerAssembly(resolver: self),
            UIAssembly()
        ])
    }

    func resolve<T, E>(_ type: T.Type, input: E? = nil) -> T {
        guard let input = input else {
            return assembler.resolver.resolve(type)!
        }

        return assembler.resolver.resolve(type, argument: input)!
    }

}
