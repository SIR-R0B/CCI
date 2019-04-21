/*
Write a program to sort a stack such that the smallest items are on the top. You can use an additional temporary stack, but you may not copy the elements into any other data structure (such as an array). The stack supports the following operations: push, pop, peek, and isEmpty.
*/

class Node {
    var value: Int
    var next: Node?
    init(_ value: Int) {
        self.value = value
    }
}

class Stack {
    var head: Node?
    func printOut() {
        guard var node = head else {
            return
        }
        while let next = node.next {
            print(node.value)
            node = next
        }
        print(node.value)
    }
    func push(_ v: Int){
        let newNode = Node(v)
        if let node = head{
            newNode.next = node
            head = newNode
            return
        }
            head = newNode
            return
        
    }
    func pop() -> Node? {
        guard let node = head else {
            return nil
        }
        let popped = node
        head = node.next
        return popped
    }
    func peek() -> Node? {
        guard let node = head else {
            return nil
        }
        return node
    }
    func isEmpty() -> Bool {
            return head == nil
    }
}

var stack = Stack()


stack.push(1111)
stack.push(2)
stack.push(3)
stack.push(34)
stack.push(3)
stack.push(33)
stack.push(3)
stack.push(3976)

stack.printOut()
//print(stack.pop()!.value as Any)
stack.printOut()
print(stack.peek()!.value as Any)
print(stack.isEmpty())
print("Begin Sort.......")

func sortStack(_ s: inout Stack){

    func swap(_ n1: inout Node, _ n2: inout Node){
        let temp = Node(n1.value)
        n1.value = n2.value
        n2.value = temp.value
    }
    guard var node = s.head else {
        return
    }

    var sorted = false

    while sorted == false {
    sorted = true
    while var next = node.next{
        if node.value > next.value {
        swap(&node, &next)
        sorted = false
        }
        node = next
    }
    if sorted == false{
        if s.head != nil{
            node = s.head!
        }
    }
    }
}

sortStack(&stack)
stack.printOut()
