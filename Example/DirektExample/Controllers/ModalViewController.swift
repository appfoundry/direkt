//
//  ModalViewController.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class ModalViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = "Tap to close!"
    }

    @objc override func didTapView() {
        navigationManager!.navigate(to: DismissingNavigator.self, from: self)
    }
}
