//
//  InTabViewController.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class InTabViewController: BaseViewController {

    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)

        view.backgroundColor = .white
        textLabel.text = tabBarController?.viewControllers?.index(of: self).map { "Tab \($0)" } ?? "?"
        title = textLabel.text
    }

    @objc override func didTapView() {
        navigationManager!.navigate(to: ModalViewControllerNavigator.self, from: self)
    }
}
