enum Opcode: Int {
    case add = 1
    case multiply = 2
    case finish = 99
}

struct AOC2019D2 {
    static func process(program: [Int], noun: Int, verb: Int) -> [Int] {
        var inputs = program
        var lineCount = inputs.count / 4
        var offset = 0
        
        inputs[1] = noun
        inputs[2] = verb
        
        while lineCount > 0 {
            let line = Array(inputs[offset...].prefix(4))
            guard let rawOpcode = line.first else { return inputs }
            guard let outputOffset = line.last else { return inputs }
            
            let opcode = Opcode(rawValue: rawOpcode)!

            switch opcode {
            case .add:
                let input1 = inputs[line[1]]
                let input2 = inputs[line[2]]
                let output = input1 + input2
                inputs[outputOffset] = output
            case .multiply:
                let input1 = inputs[line[1]]
                let input2 = inputs[line[2]]
                let output = input1 * input2
                inputs[outputOffset] = output
            case .finish:
                return inputs
            }
            
            lineCount -= 1
            offset += 4
        }
                
        return inputs
    }
}
