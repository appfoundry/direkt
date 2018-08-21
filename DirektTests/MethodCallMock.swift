//
//  Utils.swift
//  DirektTests
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

protocol MethodCallMock: AnyObject {

    associatedtype MethodCall: Equatable
    var calls: [MethodCall] { get set }
}

extension MethodCallMock {

    func makeCall(_ call: MethodCall) {
        calls.append(call)
    }

    func didCall(_ call: MethodCall) -> Bool {
        return calls.first {
            $0 == call
        } != nil
    }
}
