//
//  main.swift
//  백준 가장 긴 증가하는 부분 수열
//
//  Created by 강민성 on 2021/11/24.
//

import Foundation

let N = Int(readLine()!)!

var A: [Int] = Array(repeating: 0, count: N)
var arr: [Int] = []

A = readLine()!.split(separator: " ").map{ Int(String($0))! }

for i in 0..<A.count {

    if arr.isEmpty {
        arr.append(A[i])
    }
    else if arr.last! < A[i] {
        arr.append(A[i])
    }
    else {

        var start = 0
        var end = arr.count - 1

        while start < end {

            let mid = (start + end) / 2
            if A[i] <= arr[mid] {
                end = mid
            }
            else {
                start = mid + 1
            }
        }
        
        arr[start] = A[i]
        
    }
}


print(arr.count)
