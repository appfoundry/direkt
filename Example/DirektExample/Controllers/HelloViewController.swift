//
//  HelloViewController.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class HelloViewController: BaseViewController {

    var text: String? {
        didSet {
            textLabel.text = text.map { "Howdy \($0)!" }
        }
    }

    override var navigationItem: UINavigationItem {
        let item = super.navigationItem
        if item.rightBarButtonItem == nil {
            item.rightBarButtonItem = UIBarButtonItem(
                title: "Tab",
                style: .plain,
                target: self,
                action: #selector(goFurther)
            )
        }

        return item
    }

    @objc private func goFurther() {
        navigationManager!.navigate(to: TabBarControllerNavigator.self, using: 4, from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Hello"
    }
}
