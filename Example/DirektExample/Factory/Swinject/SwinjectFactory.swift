//
//  SwinjectFactory.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class SwinjectFactory: Factory {

    private var assembler: Assembler!

    init() {
        assembler = Assembler([
            ViewControllerAssembly(),
            NavigatorAssembly(viewControllerFactory: self),
            ManagerAssembly(factory: self),
            UIAssembly()
        ])
    }

    var guiCreatable: GUICreatable {
        return assembler.resolver.resolve(GUICreatable.self)!
    }

    func makeViewController<T: UIViewController, E>(ofType type: T.Type, input: E?) -> T {
        return resolve(T.self, input: input)
    }

    func makeNavigator<T: Navigator>(ofType type: T.Type) -> T {
        return resolve(T.self, input: nil as Void?)
    }

    // MARK: - Private

    private func resolve<T, E>(_ type: T.Type, input: E? = nil) -> T {
        guard let input = input else {
            return assembler.resolver.resolve(type)!
        }

        return assembler.resolver.resolve(type, argument: input)!
    }

}
