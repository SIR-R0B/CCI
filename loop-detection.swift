/*
Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.
DEFINITION
Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, so as to make a loop in the linked list.
EXAMPLE
Input: A -> B -> C -> D -> E -> C [the same C as before] Output: C
*/

//create a circular linked list

class Node {
    var value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}

extension Node: Hashable {

    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.next === rhs.next
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
 }

class List {
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

let first = Node(value: "A")
let second = Node(value: "B")
let third = Node(value: "C")
let fourth = Node(value: "D")
let fifth = Node(value: "E")

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = third // set the corrupt node here

let listOne = List()
listOne.head = first

//listOne.printOut()

func findCorruptLink(_ l: List) -> Node? {
    guard var node = l.head else{
        return nil
    }

    var dictionary: [Node : Int] = [:]

    while let next = node.next{
        if let count = dictionary[node]{
            dictionary[node] = count + 1
        } else{
            dictionary[node] = 1
        }
        if dictionary[node]! > 1 {
            break
        }
        node = next
    }
    return node
}

print(findCorruptLink(listOne)!.value) //func returns the node