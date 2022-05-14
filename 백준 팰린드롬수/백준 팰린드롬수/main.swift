//
//  main.swift
//  백준 팰린드롬수
//
//  Created by 강민성 on 2022/04/06.
//

import Foundation

while true {
    var input = readLine()!
    var flag = false
    if input == "0" {
        break
    }
    
    else {
        var arr = input.map{ String($0) }
        while arr.count > 1 {
            if arr.first == arr.last {
                arr.removeFirst()
                arr.removeLast()
            }
            else if arr.count == 1 {
                print("yes")
                flag = true
                break
            }
            else {
                print("no")
                flag = true
                break
            }
        }
        if flag == false {
            print("yes")
        }
    }
}
