//
//  DirektFactory.swift
//  Direkt
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

public protocol NavigatorFactory {

    func makeNavigator<T: Navigator>(ofType type: T.Type) throws -> T
}
