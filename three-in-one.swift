/*
CCI 3.1 - Three in One: Describe how you could use a single array to implement three stacks.
*/

/*
My idea: In Swift you could just have each item in your array be a Stack.
*/

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class Stack {
    var head: Node?
    var last: Node?{
        guard var node = head else {
            return nil
        }
        while let next = node.next{
            node = next
        }
        return node
    }
    func printOut(){
        guard var node = head else {
            return
        }
        while let next = node.next{
            print(node.value)
            node = next
        }
        print(node.value)
        return
    }
    func push(_ v: Int) {
        let newNode = Node(value: v)
        newNode.next = head
        head = newNode
    }
    func pop(){
        head = head?.next
    }
    func peek() -> Node? {
        return head
    }
    func isEmpty() -> Bool {
        return head == nil
    }
}

let first = Node(value: 1)
let second = Node(value: 2)
let third = Node(value: 3)
let fourth = Node(value: 4)

first.next = second
second.next = third
third.next = fourth

var list = Stack()
list.head = first

var list2 = Stack()
list2.head = first

var list3 = Stack()
list3.head = first

var stackArray = [list, list2, list3]

stackArray[1].push(99)
stackArray[2].pop()
stackArray[1].printOut()
stackArray[2].printOut()
print(stackArray[0].peek()!.value)
print(stackArray[0].isEmpty())

