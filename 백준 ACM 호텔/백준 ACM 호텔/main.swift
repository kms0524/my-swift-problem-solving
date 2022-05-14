//
//  main.swift
//  백준 ACM 호텔
//
//  Created by 강민성 on 2022/04/15.
//

import Foundation

var T = Int(readLine()!)!

for _ in 0..<T {
    let HWN = readLine()!.split(separator: " ").map { Int($0)! }
    let H = HWN[0]
    let N = HWN[2]
  
    let floor = (N % H == 0) ? H : N % H
    let room = (N % H == 0) ? N / H : (N / H) + 1
    
    if room < 10 {
        print("\(floor)0\(room)")
    }
    else {
        print("\(floor)\(room)")
    }
}
