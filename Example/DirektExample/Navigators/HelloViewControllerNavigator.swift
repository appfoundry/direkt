//
//  HelloViewControllerNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class HelloViewControllerNavigator: Navigator {

    func navigate(using input: String, from hostViewController: UIViewController, resolver: Resolver) throws {
        try hostViewController.navigationController!.pushViewController(
            resolver.resolve(HelloViewController.self, input: input),
            animated: true
        )
    }
}
