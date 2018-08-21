//
//  TabBarControllerNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class TabBarControllerNavigator: Navigator {

    func navigate(using input: Int, from hostViewController: UIViewController, factory: ViewControllerFactory) throws {
        let tab = UITabBarController()
        tab.viewControllers = try (0 ..< input).map { _ in
            try factory.makeViewController(ofType: InTabViewController.self)
        }

        hostViewController.navigationController!.pushViewController(tab, animated: true)
    }
}
