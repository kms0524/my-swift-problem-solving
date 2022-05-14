//
//  main.swift
//  백준 영화감독 숌
//
//  Created by 강민성 on 2022/04/06.
//

import Foundation

var N = Int(readLine()!)!
var count = 0
var num = 666

while true {
    var current = num
    var six = 0
    
    while current > 0 {
        if current % 10 == 6 {
            six += 1
        }
        
        else {
            six = 0
        }
        
        if six == 3 {
            count += 1
            break
        }
        
        current /= 10
        
    }
    
    if count == N {
        break
    }
    
    num += 1
}

print(num)

/*
 
 func has666(_ number: Int) -> Bool {
     var tmpNumber: Int = number
     
     while tmpNumber >= 666 {
         if (tmpNumber - 666) % 1000 == 0 { return true }
         tmpNumber /= 10
     }
     return false
 }

 var n2: Int = Int(readLine()!)!
 var name: Int = 666
 var i: Int = 1
 while i != n2 {
     name += 1
     if has666(name) {
         i += 1
     }
 }
 print(name)
 
 */
