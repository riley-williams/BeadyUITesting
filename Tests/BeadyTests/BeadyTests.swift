import XCTest
@testable import Beady

final class BeadyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Beady().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
