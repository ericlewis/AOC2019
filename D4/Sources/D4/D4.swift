import Foundation

struct D4 {

    static func part1(in range: ClosedRange<Int>) -> [Int] {
        range.filter { number in
            let digits = String(number).map { $0 }
            let countedDigits = NSCountedSet(array: digits)
            return digits == digits.sorted() && digits.filter { countedDigits.count(for: $0) >= 2 }.count > 0
        }
    }
    
    static func part2(in range: ClosedRange<Int>) -> [Int] {
        range.filter { number in
            let digits = String(number).map { $0 }
            let countedDigits = NSCountedSet(array: digits)
            return digits == digits.sorted() && digits.filter { countedDigits.count(for: $0) == 2 }.count > 0
        }
    }
}
