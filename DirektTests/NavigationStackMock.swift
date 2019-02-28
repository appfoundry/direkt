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

        case navigate(T, hostViewController: UIViewController, resolver: Resolver)

        static func == (lhs: MethodCall, rhs: MethodCall) -> Bool {
            switch (lhs, rhs) {
            case let (.navigate(lhsVal), .navigate(rhsVal)):
                return type(of: lhsVal.0) == type(of: lhsVal.0)
                    && lhsVal.hostViewController == rhsVal.hostViewController
                    && type(of: lhsVal.resolver) == type(of: rhsVal.resolver)
            }
        }
    }

    var calls: [MethodCall] = []

    func navigate(using input: T, from hostViewController: UIViewController, resolver: Resolver) throws {
        _ = try resolver.resolve(MockViewController.self, input: input)
        makeCall(.navigate(input, hostViewController: hostViewController, resolver: resolver))
    }
}

class MockResolver: MethodCallMock, Resolver {

    enum MethodCall: Equatable {

        case resolve(Any.Type, input: Any?)

        static func == (lhs: MethodCall, rhs: MethodCall) -> Bool {
            switch (lhs, rhs) {
            case let (.resolve(lhsVal), .resolve(rhsVal)):
                return lhsVal.0 == rhsVal.0
                    && lhsVal.input.map { type(of: $0) } == rhsVal.input.map { type(of: $0) }
            }
        }
    }

    enum Error: Swift.Error {

        case unkownType(Any.Type)
    }

    private let navigators: [Any]

    var calls: [MethodCall] = []

    init(navigators: [Any?]) {
        self.navigators = navigators.compactMap { $0 }
    }

    func resolve<T, Input>(_ type: T.Type, input: Input?) throws -> T {
        makeCall(.resolve(type, input: input))

        guard let vcType = type as? UIViewController.Type else {

            guard let instance = self.navigators.first(where: { Swift.type(of: $0) == T.self }).flatMap({ $0 as? T }) else {
                throw Error.unkownType(type)
            }

            return instance
        }

        if let instance = vcType.init() as? T {
            return instance
        } else {
            throw Error.unkownType(type)
        }
    }
}

class MockNavigationManager: BaseNavigationManager, MethodCallMock {

    enum MethodCall: Equatable {

        case attemptNavigate(Any.Type, input: Any, hostViewController: UIViewController)
        case didFailNavigation(Any.Type, Error, UIViewController)

        static func == (lhs: MethodCall, rhs: MethodCall) -> Bool {
            switch (lhs, rhs) {
            case let (.attemptNavigate(lhs), .attemptNavigate(rhs)):
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

    override func attemptNavigate<T: Navigator>(
        to navigator: T.Type,
        using input: T.Input,
        from hostViewController: UIViewController
    ) throws {
        makeCall(.attemptNavigate(navigator, input: input, hostViewController: hostViewController))
        try super.attemptNavigate(to: navigator, using: input, from: hostViewController)
    }

    override func didFailNavigation<T: Navigator>(to navigator: T.Type, error: Error, hostViewController: UIViewController) {
        makeCall(.didFailNavigation(navigator, error, hostViewController))
    }
}
