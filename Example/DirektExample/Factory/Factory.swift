//
//  Factory.swift
//  DirektExample
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

protocol Factory: ViewControllerFactory, NavigatorFactory {

    var guiCreatable: GUICreatable { get }
}
