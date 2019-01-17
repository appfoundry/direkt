//
//  NavigationManager.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationManager {

    func navigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) throws
}

public extension NavigationManager {

    func navigate<T: Navigator>(to navigator: T.Type, from hostViewController: UIViewController) throws where T.Input == Void {
        try navigate(to: navigator, using: (), from: hostViewController)
    }

    ///
    /// - Returns: false if navigation failed
    @discardableResult
    func attemptNavigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) -> Bool {
        return (try? self.navigate(to: T.self, using: input, from: hostViewController)) != nil
    }

    ///
    /// - Returns: false if navigation failed
    @discardableResult
    func attemptNavigate<T: Navigator>(to navigator: T.Type, from hostViewController: UIViewController) -> Bool where T.Input == Void {
        return (try? navigate(to: navigator, using: (), from: hostViewController)) != nil
    }
}
