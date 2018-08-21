//
//  ViewControllerFactoryTests.swift
//  DirektTests
//
//  Copyright © 2018 AppFoundry. All rights reserved.
//

import Foundation

import Quick
import Nimble
@testable import Direkt

class ViewControllerFactorySpec: QuickSpec {

    override func spec() {
        describe("ViewControllerFactorySpec") {
            var factory: MockFactory!

            beforeEach {
                factory = MockFactory(navigators: [])
            }

            it("handles optional parameters") {
                expect { try factory.makeViewController(ofType: MockViewController.self) }
                    .notTo(throwError())

                expect(
                    factory.didCall(
                        .makeViewController(MockViewController.self, input: nil)
                    )
                ).to(beTrue())
            }
        }
    }
}
