//
//  NavigationManager.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationManager {

    func navigate<T: Navigator>(to navigator: T.Type, using: T.Input, from hostViewController: UIViewController)
}

public extension NavigationManager {

    func navigate<T: Navigator>(to navigator: T.Type, from hostViewController: UIViewController) where T.Input == Void {
        navigate(to: navigator, using: (), from: hostViewController)
    }
}
