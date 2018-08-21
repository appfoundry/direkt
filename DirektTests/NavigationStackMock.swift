//
//  NavigationStackMock.swift
//  DirektTests
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import UIKit
import Direkt

class MockViewController: UIViewController {}

class MockNavigator<T>: MethodCallMock, Navigator {

    enum MethodCall: Equatable {

        case navigate(T, hostViewController: UIViewController, factory: ViewControllerFactory)

        static func == (lhs: MethodCall, rhs: MethodCall) -> Bool {
            switch (lhs, rhs) {
            case let (.navigate(lhsVal), .navigate(rhsVal)):
                return type(of: lhsVal.0) == type(of: lhsVal.0)
                    && lhsVal.hostViewController == rhsVal.hostViewController
                    && type(of: lhsVal.factory) == type(of: rhsVal.factory)
            }
        }
    }

    var calls: [MethodCall] = []

    func navigate(using input: T, from hostViewController: UIViewController, factory: ViewControllerFactory) throws {
        _ = try factory.makeViewController(ofType: MockViewController.self, input: input)
        makeCall(.navigate(input, hostViewController: hostViewController, factory: factory))
    }
}

class MockFactory: MethodCallMock, ViewControllerFactory, NavigatorFactory {

    enum MethodCall: Equatable {

        case makeNavigator(Any.Type)
        case makeViewController(UIViewController.Type, input: Any?)

        static func == (lhs: MethodCall, rhs: MethodCall) -> Bool {
            switch (lhs, rhs) {
            case let (.makeNavigator(lhsVal), .makeNavigator(rhsVal)):
                return lhsVal == rhsVal
            case let (.makeViewController(lhsVal), .makeViewController(rhsVal)):
                return lhsVal.0 == rhsVal.0
                    && lhsVal.input.map { type(of: $0) } == rhsVal.input.map { type(of: $0) }
            default:
                return false
            }
        }
    }

    enum Error: Swift.Error {

        case unkownNavigatorType(Any.Type)
    }

    private let navigators: [Any]

    var calls: [MethodCall] = []

    init(navigators: [Any?]) {
        self.navigators = navigators.compactMap { $0 }
    }

    func makeViewController<T: UIViewController, E>(ofType type: T.Type, input: E?) throws -> T {
        let res = T()
        makeCall(.makeViewController(type, input: input))
        return res
    }

    func makeNavigator<T: Navigator>(ofType type: T.Type) throws -> T {
        guard let instance = self.navigators.first(where: { Swift.type(of: $0) == T.self }).flatMap({ $0 as? T }) else {
            throw Error.unkownNavigatorType(type)
        }

        makeCall(.makeNavigator(type))

        return instance
    }
}

class MockNavigationManager: BaseNavigationManager, MethodCallMock {

    enum MethodCall: Equatable {

        case navigate(Any.Type, input: Any, hostViewController: UIViewController)
        case didFailNavigation(Any.Type, Error, UIViewController)

        static func == (lhs: MethodCall, rhs: MethodCall) -> Bool {
            switch (lhs, rhs) {
            case let (.navigate(lhs), .navigate(rhs)):
                return lhs.0 == rhs.0
                    && type(of: lhs.input) == type(of: rhs.input)
                    && lhs.hostViewController === rhs.hostViewController
            case let (.didFailNavigation(lhsVal), .didFailNavigation(rhsVal)):
                return lhsVal.0 == rhsVal.0
                    && lhsVal.1.localizedDescription == rhsVal.1.localizedDescription
                    && lhsVal.2 == rhsVal.2
            default:
                return false
            }
        }
    }

    var calls: [MockNavigationManager.MethodCall] = []

    override func navigate<T: Navigator>(to navigator: T.Type, using input: T.Input, from hostViewController: UIViewController) {
        makeCall(.navigate(navigator, input: input, hostViewController: hostViewController))
        super.navigate(to: navigator, using: input, from: hostViewController)
    }

    override func didFailNavigation<T: Navigator>(to navigator: T.Type, error: Error, hostViewController: UIViewController) {
        makeCall(.didFailNavigation(navigator, error, hostViewController))
    }
}
