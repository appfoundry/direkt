//
//  BaseViewController.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var navigationManager: NavigationManager?

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }

    @objc func didTapView() {}
}
