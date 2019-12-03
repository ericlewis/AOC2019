let directionX = ["L": -1, "R": 1, "U": 0, "D": 0]
let directionY = ["L": 0, "R": 0, "U": 1, "D": -1]

struct Point: Hashable {
    var x: Int
    var y: Int
}

struct D3 {
    static func getPoints(line: [String]) -> [Point: Int] {
        var x = 0
        var y = 0
        var length = 0
        var points: [Point: Int] = [:]
        
        line.forEach { vector in
            let direction = String(vector.first!)
            let distance = Int(vector.dropFirst())!
            
            (0..<distance).forEach { _ in
                x += directionX[direction]!
                y += directionY[direction]!
                length += 1
                let point = Point(x: x, y: y)
                if points[point] == nil {
                    points[point] = length
                }
            }
        }
        
        return points
    }
}
