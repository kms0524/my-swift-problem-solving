//
//  main.swift
//  백준 1의 개수 세기
//
//  Created by 강민성 on 2022/05/27.
//

import Foundation

var AB = readLine()!.split(separator: " ").map { UInt64($0)! }

var A = AB[0]
var B = AB[1]

var arr = [UInt64](repeating: 0, count: 55)

arr[0] = 1

for i in 1..<arr.count {
    arr[i] = arr[i-1] * 2 + (1 << i)
}

func bitCount(_ num: UInt64) -> UInt64 {
    var num = num
    var answer = num & 1
    
    for i in (1...54).reversed() {
        if (num & (1 << i) > 0) {
            answer += arr[i - 1] + (num - (1 << i) + 1)
            num -= (1 << i)
        }
    }
    
    return answer
}

var aSum = bitCount(A - 1)
var bSum = bitCount(B)

print(bSum - aSum)


//func findMSB(_ n: Int) -> Int {
//    if n == 0 { return 0 }
//    let msb = 1 << (n.bitWidth - n.leadingZeroBitCount - 1)
//    return msb / 2 * msb.trailingZeroBitCount + 1 + (n-msb) + findMSB(n-msb)
//}
