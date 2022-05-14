//
//  main.swift
//  백준 양팔저울
//
//  Created by 강민성 on 2021/11/22.
//

import Foundation

let weightsCount = Int(readLine()!)!
var weights = readLine()!.split(separator: " ").map { Int(String($0))! }
let beadsCount = Int(readLine()!)!
var beads = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = ""

print("weights: \(weights)")
print("beads: \(beads)")

var dp: Set<Int> = []

for weight in weights {
    var temps: Set<Int> = [weight]
    print("temps: \(temps)")
    for d in dp {
        temps.insert(abs(weight - d))
        temps.insert(weight + d)
        print("temps: \(temps)")
    }
    for temp in temps {
        dp.insert(temp)
        print("dp: \(dp)")
    }
}

for i in beads {
    answer += "\(dp.contains(i) ? "Y" : "N") "
}

print(answer)
