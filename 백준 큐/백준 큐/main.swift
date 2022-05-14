//
//  main.swift
//  백준 큐
//
//  Created by 강민성 on 2022/04/18.
//

import Foundation

var N = Int(readLine()!)!
var arr = [String]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input[0] == "push" {
        arr.append(input[1])
    }
    else if input[0] == "pop" {
        if arr.isEmpty {
            print(-1)
        }
        else {
            print(arr.removeFirst())
        }
    }
    else if input[0] == "size" {
        print(arr.count)
    }
    else if input[0] == "empty" {
        if arr.isEmpty {
            print(1)
        }
        else {
            print(0)
        }
    }
    else if input[0] == "front" {
        if arr.isEmpty {
            print(-1)
        }
        else {
            print(arr.first!)
        }
    }
    else if input[0] == "back" {
        if arr.isEmpty {
            print(-1)
        }
        else {
            print(arr.last!)
        }
    }
}


