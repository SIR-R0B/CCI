/*
Given two (singly) linked lists, determine if the two lists intersect. Return the intersecting node. Note that the intersection is defined based on reference, not value. That is, if the kth node of the first linked list is the exact same node (by reference) as the jth node of the second linked list, then they are intersecting.
*/

class Node{
    var value: Int 
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

class List{
    var head: Node?
    var last: Node?{
        guard var node = head else{
            return nil
        }
        while let next = node.next{
        node = next
        }
        return node
    }
    func append(_ v: Int){
        let newNode = Node(value: v)
        guard let node = last else{
            head = newNode
            return
        }
        node.next = newNode
        return
    }
    func printOut(){
        guard var node = head else{
            return
        }
        while let next = node.next{
            print(node.value)
            node = next
        }
        print(node.value)
    }
}

let listOne = List()

let firstNode = Node(value: 1)
let secondNode = Node(value: 2)
let thirdNode = Node(value: 3)
let fourthNode = Node(value: 4)
let alphaNode = Node(value: 5)
let betaNode = Node(value: 6)

firstNode.next = secondNode
secondNode.next = thirdNode
thirdNode.next = fourthNode

alphaNode.next = betaNode
betaNode.next = firstNode //attach the intersection here

listOne.head = firstNode

let listTwo = List()
listTwo.head = alphaNode

listOne.printOut()
listTwo.printOut()

func findIntersect(_ l: List, _ r: List) -> Node? {
    func checkSame(_ n1: Node, _ n2: Node) -> Bool {
        print("check \(n1.value) and \(n2.value)")
        if n1 === n2 {
                print("true")
                return true
            } else {
                print("false")
                return false
            }
    }
    guard var lNode = l.head else{
        return nil
    }
    guard var rNode = r.head else{
        return nil
    }
        while let lNext = lNode.next{
            while let rNext = rNode.next{
                if checkSame(lNode, rNode) == true{
                    return lNode
                } else {
                    rNode = rNext
                }
             }
            if r.head != nil {
                rNode = r.head!
            }
            lNode = lNext        
    }
    if r.last != nil {
        rNode = r.last!
    }
    if checkSame(lNode, rNode) == true{
        return lNode
    } else{
        return nil
    }
}
print(findIntersect(listOne,listTwo)!.value)