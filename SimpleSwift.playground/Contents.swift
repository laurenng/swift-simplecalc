print("Welcome to the UW Calculator Playground")


// array format
func calculate(_ args: [String]) -> Int {
    if(args.count == 1) {
        return 0
    } else if (args[1] == "-" || args[1] == "+" || args[1] == "%" || args[1] == "/" || args[1] == "*") {
        return simpleMath(lhs: args[0], rhs: args[2], symbol: args[1])
    } else if (args.contains("count")) {
        let arrayLength = args.count
        return arrayLength - 1
    } else if (args.contains("avg")) {
        var sum = 0;
        for value in args {
            if (value != "avg") {
                let num = Int(value)
                sum += num!
            }
        }
        let count = args.count - 1
        return sum / count
    } else if (args.contains("fact")) {
        let times = Int(args[0])!
        if (times == 0) {
            return 1
        }
        var total = 1
        for i in 1...times {
            total = total * i
        }
        return total
    }
    return 0
}

func simpleMath(lhs: String, rhs: String, symbol: String) -> Int{
    let left = Int(lhs)
    let right = Int(rhs)
    
    if (symbol == "+") {
        return left! + right!
    } else if (symbol == "-") {
        return left! - right!
    } else if (symbol == "%") {
        return left! % right!
    } else if (symbol == "/") {
        return left! / right!
    } else {
        return left! * right!
    }
}

// single string
func calculate(_ arg: String) -> Int {
    let array: [String] = arg.split(separator: " ").map({ substr in String(substr) })
    let final = calculate(array)
    return final
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly

calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculateDouble(_ args: [String]) -> Double {
     if(args.count == 1) {
        return 0.0
     } else if (args[1] == "-" || args[1] == "+" || args[1] == "%" || args[1] == "/" || args[1] == "*") {
        return simpleDoubleMath(lhs: args[0], rhs: args[2], symbol: args[1])
     } else if (args.contains("count")) {
        let arrayLength = Double(args.count)
        return arrayLength - 1.0
     }
    return -1.0
}

func calculateDouble(_ arg: String) -> Double {
    let array: [String] = arg.split(separator: " ").map({ substr in String(substr) })
    let final = calculateDouble(array)
    return final
}

func simpleDoubleMath(lhs: String, rhs: String, symbol: String) -> Double{
    let left = Double(lhs)!
    let right = Double(rhs)!
    
    if (symbol == "+") {
        return left + right
    } else if (symbol == "-") {
        return left - right
    } else if (symbol == "%") {
        return left.truncatingRemainder(dividingBy: right)
    } else if (symbol == "/") {
        return left / right
    } else {
        return left * right
    }
}

calculateDouble(["2.0", "+", "2.0"]) == 4.0
calculateDouble([".5", "+", "1.5"]) == 2.0
calculateDouble(["12.0", "-", "12.0"]) == 0.0
calculateDouble(["2.5", "*", "2.5"]) == 6.25
calculateDouble(["2.0", "/", "2.0"]) == 1.0
calculateDouble(["2.0", "%", "2.0"]) == 0.0
calculateDouble("1.0 2.0 3.0 4.0 5.0 count") == 5

