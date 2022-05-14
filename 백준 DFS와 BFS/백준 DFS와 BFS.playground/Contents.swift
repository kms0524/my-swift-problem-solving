import Foundation

var readline = readLine()!
/*import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0))! }


let N = input[0]
let M = input[1]
let V = input[2]

var map: [[Int]] = Array(repeating:Array(repeating: 0, count: 0), count: N + 1)

func DFS(start: Int) {
    
    var visited = [Int]()
    var stack = [start]
    
    while !stack.isEmpty {
        let node = stack.popLast()!
        
        if !visited.contains(node) {
            visited.append(node)
            print(node, terminator: " ")
            stack.append(contentsOf: map[node].sorted(by: >))
        }
    }
    
}

func BFS(start: Int) {
    
    var visited = [Int]()
    var queue = [start]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if !visited.contains(node) {
            visited.append(node)
            print(node, terminator: " ")
            queue.append(contentsOf: map[node].sorted())
        }
    }
    
}


for _ in 0..<M {
    
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let start = input[0]
    let end = input[1]
    map[start].append(end)
    map[end].append(start)
}

DFS(start: V)
print()
BFS(start: V)
*/
