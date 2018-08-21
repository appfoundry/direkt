//
//  GUICreatable.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

protocol GUICreatable {

    func createWindow(viewControllerFactory: ViewControllerFactory) -> UIWindow
}
