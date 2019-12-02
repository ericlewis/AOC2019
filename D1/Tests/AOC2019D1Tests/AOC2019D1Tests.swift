import XCTest
@testable import AOC2019D1

final class AOC2019D1Tests: XCTestCase {
    func testSamples() {
        XCTAssertEqual(AOC2019D1.neededFuel(for: 12), 2)
        XCTAssertEqual(AOC2019D1.neededFuel(for: 14), 2)
        XCTAssertEqual(AOC2019D1.neededFuel(for: 1969), 654)
        XCTAssertEqual(AOC2019D1.neededFuel(for: 100756), 33583)
    }
    
    func testProcessAll() {
        guard let input = FileManager.default.contents(atPath: "input.txt") else { return }
        guard let inputString = String(data: input, encoding: .utf8) else { return }
        let result = inputString
        .split(separator: "\n")
        .reduce(0) {
            $0 + AOC2019D1.neededFuel(for: (Int(String($1)) ?? 0))
        }
        
        XCTAssertEqual(result, 3405721)
    }
    
    func testProcessAll2() {
        guard let input = FileManager.default.contents(atPath: "input.txt") else { return }
        guard let inputString = String(data: input, encoding: .utf8) else { return }
        let result = inputString
        .split(separator: "\n")
        .map {
            let baseFuel = AOC2019D1.neededFuel(for: (Int(String($0)) ?? 0))
            var fuelCounter = AOC2019D1.neededFuel(for: baseFuel)
            var neededFuel = 0

            while fuelCounter > 0 {
                neededFuel += fuelCounter
                fuelCounter = AOC2019D1.neededFuel(for: fuelCounter)
            }
            
            return neededFuel + baseFuel
        }
        .reduce(0, +)
        
        XCTAssertEqual(result, 5105716)
    }
}
