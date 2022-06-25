# Sequential Payments Code Challenge

My first solution satisfied the given examples, but I knew that it would not cover all cases.

My second solution will provide the correct answer for all cases.

## Problem Description
A company has a list of expected revenues and payments for the upcoming year in chronological order. The problem is that at some moments in time the sum of previous payments can be larger than the total previous revenue. This would put the company in debt. To avoid this problem the company takes a very simple approach. It reschedules some expenses to the end of the year.

You are given an array of integers, where the positive numbers represent revenue and negative numbers represent expenses, all in chronological order. In one move you can relocate any expense (negative number) to the end of the array. What is the minimum number of such relocations to make sure that the company never falls into debt? In other words: you need to make sure that there is no consecutive sequence of elements starting from the beginning of the array, that sums up to a negative number.

You can assume that the sum of all elements in A is nonnegative.

Write a function:

    public func solution(_ A : inout [Int]) -> Int

that, given an array A of N integers, returns the minimum number of relocations, so that [the] company never falls into debt.

### Examples:

1. Given A = [10, -10, -1, -1, 10], the function should return 1. It is enough to move -10 to the end of the array.

2. Given A = [-1, -1, -1, 1, 1, 1, 1], the function should return 3. The negative elements at the beginning must be moved to the end to avoid debt at the start of the year.

3. Given A = [5, -2, -3, 1], the function should return 0. The company balance is always nonnegative.
