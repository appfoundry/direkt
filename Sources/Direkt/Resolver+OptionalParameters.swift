//
//  Resolver+OptionalParameters.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public extension Resolver {

    func resolve<T>(_ type: T.Type) throws -> T {
        return try resolve(type, input: nil as Void?)
    }
}
