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
            var resolver: MockResolver!
            var manager: MockNavigationManager!
            var navigator: MockNavigator<String>!

            beforeEach {
                navigator = MockNavigator()
                resolver = MockResolver(navigators: [navigator, MockNavigator<Void>()])
                manager = MockNavigationManager(resolver: resolver)
            }

            context("ready for testing") {
                it("is able to create navigation actors") {
                    expect { try resolver.resolve(MockViewController.self, input: "mock") }
                        .notTo(throwError())
                    expect { try resolver.resolve(MockNavigator<String>.self) }
                        .notTo(throwError())
                    expect { try resolver.resolve(MockNavigator<Void>.self) }
                        .notTo(throwError())
                }

                it("fails to handle non trivial navigators") {
                    expect { try resolver.resolve(MockNavigator<Int>.self) }
                        .to(throwError())

                    manager.navigate(to: MockNavigator<Int>.self, using: 0, from: mockHost)
                    expect(
                        manager.didCall(
                            .didFailNavigation(
                                MockNavigator<Int>.self,
                                MockResolver.Error.unkownType(MockNavigator<Int>.self),
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
                        .attemptNavigate(MockNavigator<Void>.self, input: (), hostViewController: mockHost)
                    )
                ).to(beTrue())
            }

            it("handles optional parameters with failable navigation") {
                try? manager.attemptNavigate(to: MockNavigator<Void>.self, from: mockHost)

                expect(
                    manager.didCall(
                        .attemptNavigate(MockNavigator<Void>.self, input: (), hostViewController: mockHost)
                    )
                ).to(beTrue())
            }

            context("navigation result") {
                it("provides failed navigation error") {
                    expect { try manager.attemptNavigate(to: MockNavigator<Double>.self, using: 0, from: mockHost) }
                        .to(throwError(MockResolver.Error.unkownType(MockNavigator<String>.self)))
                }

                it("provides navigation result") {
                    expect(manager.navigate(to: MockNavigator<Void>.self, from: mockHost)) == true
                    expect(manager.navigate(to: MockNavigator<Double>.self, using: 0, from: mockHost)) == false
                }
            }

            context("performs navigation step") {
                beforeEach {
                    manager.navigate(to: MockNavigator<String>.self, using: "mock", from: mockHost)
                }

                it("resolves dependencies") {
                    expect(
                        resolver.didCall(
                            .resolve(MockNavigator<String>.self, input: nil as Void?)
                        )
                    ).to(beTrue())

                    expect(
                        resolver.didCall(
                            .resolve(MockViewController.self, input: "mock")
                        )
                    ).to(beTrue())
                }

                it("calls navigation methods") {
                    expect(
                        manager.didCall(
                            .attemptNavigate(MockNavigator<String>.self, input: "mock", hostViewController: mockHost)
                        )
                    ).to(beTrue())

                    expect(
                        navigator.didCall(
                            .navigate("mock", hostViewController: mockHost, resolver: resolver)
                        )
                    ).to(beTrue())
                }
            }
        }
    }
}
