/*
You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.
Follow-up: what if you had to add numbers oriented right to left
*/

import Darwin

extension BinaryInteger {
    var digits: [Int]{
        return String(describing: self).compactMap {Int(String($0))}
    }
}

class Node{
    var value: Int 
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

class List{
    var head: Node?
    var count: Int{
        guard var node = head else{
            return 0
        }
        var count = 1
        while let next = node.next{
            count += 1
            node = next
        }
        return count
    }
    func append(_ v: Int){
        let newNode = Node(value: v)
        guard var node = head else{
            head = newNode
            return
        }
        while let next = node.next{
            node = next
        }
        node.next = newNode
    }
    func printList(){
        guard var node = head else{
            return
        }
        while let next = node.next{
            print(node.value, terminator: "")
            node = next
        }
            //print tail and newline
            print(node.value)
    }
}

/*func addLeft2Right(_ l: List, _ r: List) -> List {

    let result = List()
    var sum = 0
    var carryOver = 0
    var tailSum = 0

    guard var nodeLeft = l.head else{
        return l
    }
    guard var nodeRight = r.head else{
        return r
    }

    while let nextLeft = nodeLeft.next{
        if let nextRight = nodeRight.next{
            if carryOver == 0 {
            sum = nodeLeft.value + nodeRight.value
            } else {
            sum = nodeLeft.value + nodeRight.value + carryOver
            }
            if sum > 9{
                sum = sum - 10
                carryOver = 1
            } else {
                carryOver = 0
            }
            result.append(sum)            
            nodeRight = nextRight
        }
        nodeLeft = nextLeft
        sum = 0
    }

    if carryOver == 0 {
            tailSum = nodeLeft.value + nodeRight.value
            } else {
            tailSum = nodeLeft.value + nodeRight.value + carryOver
            }
    result.append(tailSum)

    return result

}*/

func addRight2Left(_ l: List, _ r: List) -> List {

    let result = List()
    var sumLists = 0

    func sumList(_ list: List) -> Int{
        guard var node = list.head else{
        return 0
    }

    var sum = 0
    var zeroCount = list.count

    if zeroCount > 1{
            //Swift pow(_:_:) function only working with Doubles? Also requires 'import Darwin'
            sum += node.value * Int(pow(Float(10),Float(zeroCount-1)))
            zeroCount -= 1
        } else {
            sum += node.value 
        }

    while let next = node.next{
        if zeroCount > 1{
            sum += next.value * Int(pow(Float(10),Float(zeroCount-1)))
        } else {
            sum += next.value 
            break
        }
        node = next
        zeroCount -= 1
    }
    return sum
    }

    sumLists = sumList(l) + sumList(r)
    var digits = sumLists.digits //requires extension of BinaryInteger
    for i in 0..<digits.count{
        result.append(digits[i])
    }
    return result
}

func addLeft2Right(_ l: List, _ r: List) -> List {

    let result = List()
    var sumLists = 0

    func sumList(_ list: List) -> Int{
        guard var node = list.head else{
        return 0
    }

    var sum = 0
    var zeroCount = 0
    
    sum += node.value 
    zeroCount += 1

    while let next = node.next{
        sum += next.value * Int(pow(Float(10),Float(zeroCount)))
        node = next
        zeroCount += 1
    }
    return sum
    }

    sumLists = sumList(l) + sumList(r)
    var digits = sumLists.digits //requires extension of BinaryInteger
    for i in 0..<digits.count{
        result.append(digits[i])
    }
    return result
}

var lhs = List()
var rhs = List()

lhs.append(7)
//lhs.append(1)
//lhs.append(6)
rhs.append(5)
//rhs.append(9)
rhs.append(2)

lhs.printList()
rhs.printList()

addLeft2Right(lhs,rhs).printList()
addRight2Left(lhs,rhs).printList()





