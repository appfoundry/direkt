//
//  Resolver.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

public protocol Resolver {

    func resolve<T, Input>(_ type: T.Type, input: Input?) throws -> T
}
