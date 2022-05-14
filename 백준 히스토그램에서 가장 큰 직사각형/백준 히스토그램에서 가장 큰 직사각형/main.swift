//
//  main.swift
//  백준 히스토그램에서 가장 큰 직사각형
//
//  Created by 강민성 on 2022/04/26.
//

import Foundation

var histogram = [Int]()

func getArea(_ left: Int, _ right: Int) -> Int {
    if left == right {
        return histogram[left]
    }
    
    var mid = (left + right) / 2
    
    var leftArea = getArea(left, mid)
    var rightArea = getArea(mid + 1, right)
    
    var maxArea = max(leftArea, rightArea)
    
    maxArea = max(maxArea, getMidArea(left, right, mid))
    
    return maxArea
}

func getMidArea(_ low: Int, _ high: Int, _ mid: Int) -> Int {
    var goLeft = mid
    var goRight = mid
    
    var height = histogram[mid]
    
    var maxArea = height
    
    while low < goLeft && high > goRight {
        
        if histogram[goLeft - 1] < histogram[goRight + 1] {
            goRight += 1
            height = min(height, histogram[goRight])
        }
        else {
            goLeft -= 1
            height = min(height, histogram[goLeft])
        }
        
        maxArea = max(maxArea, height * (goRight - goLeft + 1))
    }
    
    while goRight < high {
        goRight += 1
        height = min(height, histogram[goRight])
        maxArea = max(maxArea, height * (goRight - goLeft + 1))
    }
    
    while goLeft > low {
        goLeft -= 1
        height = min(height, histogram[goLeft])
        maxArea = max(maxArea, height * (goRight - goLeft + 1))
    }
    
    return maxArea
    
}

while true {
    var tempInput = readLine()!
    
    if tempInput == "0" {
        break
    }
    
    else {
        var input = tempInput.split(separator: " ").map { Int($0)! }
        var N = input[0]
        histogram = Array(input[1...(input.count - 1)])
        
        print(getArea(0, N - 1))
    }
}
