import XCTest
@testable import Swift_Containers

final class Swift_ContainersTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Swift_Containers().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
