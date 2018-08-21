//
//  HelloViewControllerNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class HelloViewControllerNavigator: Navigator {

    func navigate(using input: String, from hostViewController: UIViewController, factory: ViewControllerFactory) throws {
        try hostViewController.navigationController!.pushViewController(
            factory.makeViewController(ofType: HelloViewController.self, input: input),
            animated: true
        )
    }
}
