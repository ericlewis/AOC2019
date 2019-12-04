import XCTest
@testable import D4

final class D4Tests: XCTestCase {
    func testPart1() {
        XCTAssertEqual(D4.part1(in: 240920...789857).count, 1154)
    }
    
    func testPart2() {
        XCTAssertEqual(D4.part2(in: 240920...789857).count, 750)
    }
}
