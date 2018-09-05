//
//  ModalViewControllerNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

class ModalViewControllerNavigator: Navigator {

    func navigate(using input: Void, from hostViewController: UIViewController, resolver: Resolver) throws {
        try hostViewController.present(
            resolver.resolve(ModalViewController.self),
            animated: true,
            completion: nil
        )
    }
}
