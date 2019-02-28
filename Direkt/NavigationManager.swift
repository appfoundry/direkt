//
//  NavigationManager.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationManager {

    func attemptNavigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) throws
}

public extension NavigationManager {

    ///
    /// - Returns: false if navigation failed
    @discardableResult
    func navigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) -> Bool {
        return (try? attemptNavigate(to: T.self, using: input, from: hostViewController)) != nil
    }

    ///
    /// - Returns: false if navigation failed
    @discardableResult
    func navigate<T: Navigator>(to navigator: T.Type, from hostViewController: UIViewController) -> Bool where T.Input == Void {
        return navigate(to: T.self, using: (), from: hostViewController)
    }

    func attemptNavigate<T: Navigator>(to navigator: T.Type, from hostViewController: UIViewController) throws where T.Input== Void {
        try attemptNavigate(to: T.self, using: (), from: hostViewController)
    }
}
