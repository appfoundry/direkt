//
//  TabBarControllerNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class TabBarControllerNavigator: Navigator {

    func navigate(using input: Int, from hostViewController: UIViewController, resolver: Resolver) throws {
        let tab = UITabBarController()
        tab.viewControllers = try (0 ..< input).map { _ in
            try resolver.resolve(InTabViewController.self)
        }

        hostViewController.navigationController!.pushViewController(tab, animated: true)
    }
}
