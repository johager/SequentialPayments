import UIKit

func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    var numToMove = 0
    
    // find first positive
    var iPos = 0
    var balance = 0
    for i in 0..<A.count {
        if A[i] > 0 {
            iPos = i
            balance = A[i]
            break
        } else {
            numToMove += 1
        }
    }
    
    // cycle through the remainder of the array
    for i in iPos + 1..<A.count - 1 {
        let newBal = balance + A[i]
        if newBal <= 0 {
            if newBal + A[i + 1] < 0 {
                numToMove += 1
            } else {
                balance += A[i]
            }
        } else if newBal < 0 {
            numToMove += 1
        } else {
            balance += A[i]
        }
    }
    
    return numToMove
}

func testCase(_ a: [Int], exp: Int) {
    var A = a
    let res = solution(&A)
    let success = res == exp
    print("\(a), res: \(res), success: \(success)")
}

testCase([10,-10,-1,-1,10], exp: 1)
testCase([-1,-1,-1,1,1,1,1], exp: 3)
testCase([5,-2,-3,1], exp: 0)
testCase([10,-10,1,-1,-1,10], exp: 1)  // my test case
