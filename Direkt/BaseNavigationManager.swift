//
//  BaseNavigationManager.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

open class BaseNavigationManager: NavigationManager {

    private let resolver: Resolver

    public init(resolver: Resolver) {
        self.resolver = resolver
    }

    open func navigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) {
        do {
            try resolver
                .resolve(navigator)
                .navigate(using: input, from: hostViewController, resolver: resolver)
        } catch {
            didFailNavigation(to: navigator, error: error, hostViewController: hostViewController)
        }
    }

    open func didFailNavigation<T: Navigator>(to navigator: T.Type, error: Error, hostViewController: UIViewController) {}
}
