//
//  ViewControllerFactory.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewControllerFactory {

    func makeViewController<T: UIViewController, E>(ofType type: T.Type, input: E?) throws -> T
}
