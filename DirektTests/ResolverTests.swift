//
//  ResolverTests.swift
//  DirektTests
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

import Quick
import Nimble
@testable import Direkt

class ResolverSpec: QuickSpec {

    override func spec() {
        describe("ViewControllerFactorySpec") {
            var resolver: MockResolver!

            beforeEach {
                resolver = MockResolver(navigators: [])
            }

            it("handles optional parameters") {
                expect { try resolver.resolve(MockViewController.self) }
                    .notTo(throwError())

                expect(
                    resolver.didCall(
                        .resolve(MockViewController.self, input: nil)
                    )
                ).to(beTrue())
            }
        }
    }
}
