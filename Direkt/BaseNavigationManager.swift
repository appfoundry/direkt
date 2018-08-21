//
//  BaseNavigationManager.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

open class BaseNavigationManager: NavigationManager {

    private let viewControllerFactory: ViewControllerFactory
    private let navigatorFactory: NavigatorFactory

    public init(viewControllerFactory: ViewControllerFactory, navigatorFactory: NavigatorFactory) {
        self.viewControllerFactory = viewControllerFactory
        self.navigatorFactory = navigatorFactory
    }

    open func navigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) {
        do {
            try navigatorFactory
                .makeNavigator(ofType: navigator)
                .navigate(using: input, from: hostViewController, factory: viewControllerFactory)
        } catch {
            didFailNavigation(to: navigator, error: error, hostViewController: hostViewController)
        }
    }

    open func didFailNavigation<T: Navigator>(to navigator: T.Type, error: Error, hostViewController: UIViewController) {}
}
