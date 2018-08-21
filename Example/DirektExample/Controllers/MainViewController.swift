//
//  MainViewController.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit

private let kCellIdentifier = "Cell"

class MainViewController: UITableViewController {

    private let menu: [String] = [
        "Partner",
        "Chap",
        "Buddy"
    ]

    var navigationManager: NavigationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        title = "Main"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        cell.textLabel?.text = menu[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = menu[indexPath.row]
        navigationManager?.navigate(to: HelloViewControllerNavigator.self, using: text, from: self)
    }
}
