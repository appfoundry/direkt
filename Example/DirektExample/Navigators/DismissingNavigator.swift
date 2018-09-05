//
//  DismissingNavigator.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

class DismissingNavigator: Navigator {

    func navigate(using input: Void, from hostViewController: UIViewController, resolver: Resolver) {
        let presentingViewController = hostViewController.presentingViewController

        presentingViewController?.dismiss(animated: true)
    }
}
