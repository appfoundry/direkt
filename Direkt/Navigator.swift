//
//  Direkt.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public protocol Navigator {

    associatedtype Input

    func navigate(using input: Input, from hostViewController: UIViewController, resolver: Resolver, manager: NavigationManager) throws
}
