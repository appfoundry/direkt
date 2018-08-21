//
//  SwinjectUtils.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject

extension Resolver {

    func resolve<T, E>(_ path: ReferenceWritableKeyPath<T, E>, in object: T) {
        return object[keyPath: path] = resolve(E.self)!
    }

    func resolve<T, E, Arg1>(_ path: ReferenceWritableKeyPath<T, E>, in object: T, argument: Arg1) {
        return object[keyPath: path] = resolve(E.self, argument: argument)!
    }
}

extension Container {

    func register<T>(factory: @escaping() -> T) {
        register(T.self) { _ in
            factory()
        }
    }
}
