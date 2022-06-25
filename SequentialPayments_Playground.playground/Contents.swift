import UIKit

func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    class Option {
        var balance: Int
        var numToMove: Int
        
        init(balance: Int, numToMove: Int) {
            self.balance = balance
            self.numToMove = numToMove
        }
        
        func apply(delta: Int) {
            balance += delta
        }
        
        func newOption(with delta: Int) -> Option? {
            // always do a deferral, optionally apply valid delta
            
            defer {
                numToMove += 1
            }
            
            let newBalance = balance + delta
            
            guard newBalance > 0 else { return nil }
            let newOption = Option(balance: newBalance, numToMove: numToMove)
            return newOption
        }
    }
    
    // find first positive
    var iPos = 0
    var balance = 0
    var numToMove = 0
    for i in 0..<A.count {
        if A[i] > 0 {
            iPos = i
            balance = A[i]
            break
        } else {
            numToMove += 1
        }
    }
    
    var options = [Option(balance: balance, numToMove: numToMove)]
    
    // cycle through the remainder of the array
    for i in iPos + 1..<A.count - 1 {
        if A[i] > 0 {
            for option in options {
                option.apply(delta: A[i])
            }
        } else {
            for option in options {
                if let newOption = option.newOption(with: A[i]) {
                    options.append(newOption)
                }
            }
        }
    }
    
    return options.min { $0.numToMove < $1.numToMove }!.numToMove
}

func testCase(_ a: [Int], exp: Int) {
    var A = a
    let res = solution(&A)
    let success = res == exp
    print("\(a), res: \(res), exp: \(exp), success: \(success)")
}

testCase([10,-10,-1,-1,10], exp: 1)
testCase([-1,-1,-1,1,1,1,1], exp: 3)
testCase([5,-2,-3,1], exp: 0)
testCase([10,-10,1,-1,-1,10], exp: 1)  // my test case
testCase([10,-9,1,-1,-1,-1,-1,-1,20], exp: 1)  // my test case
