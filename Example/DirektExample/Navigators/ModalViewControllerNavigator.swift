//
//  ModalViewControllerNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

class ModalViewControllerNavigator: Navigator {

    func navigate(using input: Void, from hostViewController: UIViewController, factory: ViewControllerFactory) throws {
        try hostViewController.present(
            factory.makeViewController(ofType: ModalViewController.self),
            animated: true,
            completion: nil
        )
    }
}
