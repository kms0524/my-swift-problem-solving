//
//  main.swift
//  백준 재곱 ㄴㄴ
//
//  Created by 강민성 on 2022/07/07.
//

import Foundation

var K = Int64(readLine()!)!

/*
 mobius func :
 1024 = 2 ^ 10
 mob(1024) = 0 (소인수의 지수가 10(2 이상))
 137 = 137
 mob(137) = -1 (소인수가 1개)
 1781 = 13 * 137
 mob(1781) = 1 (소인수가 2개)
 */

var arr = [Int64](repeating: 0, count: 50000)
arr[1] = 1

func mob() {
    do {
        var i = 1
        while i <= 42000 {
            do {
                var j = 2 * i
                while j <= 42000 {
                    arr[j] -= arr[i]
                    j += i
                }
            }
            i += 1
        }
    }

}

mob()

func countSquareFree(_ K: Int64) -> Int64 {
    
    var count: Int64 = 0
    var j: Int64 = 1
    
    for i: Int64 in (j * j)...K {
        count += K * arr[Int(i)] / (i * i)
        j += 1
        if j * j > K {
            break
        }
    }
    return count
}


var start: Int64 = 0
var end: Int64 = 2 * K

while start < end - 1 {
    var mid = (start + end) / 2
    
    if countSquareFree(mid) < K {
        start = mid
    }
    else {
        end = mid
    }
}

print(end)
