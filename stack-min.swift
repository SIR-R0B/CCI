/*Stack Min: How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop and min should all operate in 0(1) time.*/

// Answer: each node knows the min of the substack below it, so when the min pops off the min can be updated

class Node {
    var value: Int
    var next: Node?
    var nextMin: Int?
    init(value: Int) {
        self.value = value
    }
}

struct Stack {
    var head: Node?
    var min: Int?
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
    mutating func push(_ v: Int) {
        let newNode = Node(value: v)
        guard let node = head else {
        head = newNode
        min = v  // assign min for new stacks on first push of value
        return
        }
        if let currentMin = min, v < currentMin {
            node.nextMin = currentMin          
            min = v
        } else {
            node.nextMin = subStack()?.min

        }

        newNode.next = node
        head = newNode
    }
    mutating func pop() {
        if let node = head, let currentMin = min{
            if node.value == currentMin {
                min = subStack()?.findMin()
            }
        }
        head = head?.next

    }
    func findMin() -> Int?{
        guard var node = head else{
            return nil
        }
        var min = node.value

        while let next = node.next{
            if next.value < min{
                min = next.value
            }
            node = next
        }
        if min > node.value{
            min = node.value
            return min
        }
        return min
    }
    func subStack() -> Stack?{

        guard let node = head else{
            return nil
        }
        var newStack = Stack(head: node.next, min: nil)
        newStack.min = newStack.findMin()
        return newStack
    }
}

var stack = Stack()

stack.push(11)
stack.push(2)
stack.push(33)
stack.push(4)
stack.push(54)

stack.pop()

stack.printOut()
print("Min: ",stack.min as Any)
