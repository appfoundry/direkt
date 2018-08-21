//
//  DirektTests.swift
//  DirektTests
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Direkt

class NavigationManagerSpec: QuickSpec {

    // swiftlint:disable next function_body_length
    override func spec() {
        let mockHost = UIViewController()

        describe("NavigationManagerSpec") {
            var factory: MockFactory!
            var manager: MockNavigationManager!
            var navigator: MockNavigator<String>!

            beforeEach {
                navigator = MockNavigator()
                factory = MockFactory(navigators: [navigator, MockNavigator<Void>()])
                manager = MockNavigationManager(viewControllerFactory: factory, navigatorFactory: factory)
            }

            context("ready for testing") {
                it("is able to create navigation actors") {
                    expect { try factory.makeViewController(ofType: MockViewController.self, input: "mock") }
                        .notTo(throwError())
                    expect { try factory.makeNavigator(ofType: MockNavigator<String>.self) }
                        .notTo(throwError())
                    expect { try factory.makeNavigator(ofType: MockNavigator<Void>.self) }
                        .notTo(throwError())
                }

                it("fails to handle non trivial navigators") {
                    expect { try factory.makeNavigator(ofType: MockNavigator<Int>.self) }
                        .to(throwError())

                    manager.navigate(to: MockNavigator<Int>.self, using: 0, from: mockHost)
                    expect(
                        manager.didCall(
                            .didFailNavigation(
                                MockNavigator<Int>.self,
                                MockFactory.Error.unkownNavigatorType(MockNavigator<Int>.self),
                                mockHost
                            )
                        )
                    ).to(beTrue())
                }
            }

            it("handles optional parameters") {
                manager.navigate(to: MockNavigator<Void>.self, from: mockHost)

                expect(
                    manager.didCall(
                        .navigate(MockNavigator<Void>.self, input: (), hostViewController: mockHost)
                    )
                ).to(beTrue())
            }

            context("performs navigation step") {
                beforeEach {
                    manager.navigate(to: MockNavigator<String>.self, using: "mock", from: mockHost)
                }

                it("resolves dependencies") {
                    expect(
                        factory.didCall(
                            .makeNavigator(MockNavigator<String>.self)
                        )
                    ).to(beTrue())

                    expect(
                        factory.didCall(
                            .makeViewController(MockViewController.self, input: "mock")
                        )
                    ).to(beTrue())
                }

                it("calls navigation methods") {
                    expect(
                        manager.didCall(
                            .navigate(MockNavigator<String>.self, input: "mock", hostViewController: mockHost)
                        )
                    ).to(beTrue())

                    expect(
                        navigator.didCall(
                            .navigate("mock", hostViewController: mockHost, factory: factory)
                        )
                    ).to(beTrue())
                }
            }
        }
    }
}
