//
//  UIAssembly.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import Swinject

class UIAssembly: Assembly {

    func assemble(container: Swinject.Container) {
        container.register(GUICreatable.self) { _ in
            GUICreator()
        }
    }
}
