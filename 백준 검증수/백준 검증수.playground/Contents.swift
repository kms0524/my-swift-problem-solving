import UIKit

var input = readLine()!.split(separator: " ").map{ Int($0)! }

input.map { $0 * $0 }


