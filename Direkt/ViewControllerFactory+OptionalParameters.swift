//
//  ViewControllerFactory+OptionalParameters.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public extension ViewControllerFactory {

    func makeViewController<T: UIViewController>(ofType type: T.Type) throws -> T {
        return try makeViewController(ofType: type, input: nil as Void?)
    }
}
