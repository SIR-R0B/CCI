/*
Queue via Stacks: Implement a MyQueue class which implements a queue using two stacks.
*/

class Node {
    var value: Any
    var next: Node?
    
    init(_ value: Any) {
        self.value = value
    }
}

class Stack {
    var head: Node?
    var last: Node?{
            guard var node = head else {
            return nil
            }
            while let next = node.next {
            node = next
            }
            return node
    }
    func printOut() {
        guard var node = head else {
            return
        }
        while let next = node.next{
            print(node.value)
            node = next
        }
        print(node.value)
    }
    func push(_ v: Any){
        let newNode = Node(v)
        guard let node = head else {
            head = newNode
            return
        }
        newNode.next = node
        head = newNode
    }
    func pop() -> Node?{
        guard let node = head else{
            return nil
        }
        if let next = node.next{
            let popped = node
            head = next
            return popped
        } else {
            head = nil
            return node
        }
    }
}

class MyQueue {

    var firstStack: Stack

    func enqueue(_ v: Any) {
        firstStack.push(v)
    }

    func dequeue() -> Node? {

        guard let dequeued = firstStack.last else {
            return nil
        }

        guard var node = firstStack.head else {
            return nil
        }

        if node === dequeued {
            firstStack.head = nil
            return dequeued
        }

        while let next = node.next {
            if next === firstStack.last {
                node.next = nil
            }
            node = next
        }
        return dequeued
    }
    
    init(firstStack: Stack) {
        self.firstStack = firstStack
    }
    

}

var stack = Stack()

var queue = MyQueue(firstStack: stack)
queue.enqueue(3)
queue.enqueue(2)
queue.enqueue(1)

queue.firstStack.printOut()

queue.dequeue()
queue.dequeue()
//queue.dequeue()


queue.firstStack.printOut()


//print(queue.dequeue()!.value)
//print(queue.dequeue()!.value)
//queue.firstStack.printOut()
//print(queue.dequeue()!.value)