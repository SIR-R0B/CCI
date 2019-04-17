/*
Stack of Plates: Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOfStacks that mimics this. SetOfStacks should be composed of several stacks and should create a new stack once the previous one exceeds capacity. SetOfStacks. push () and SetOfStacks. pop () should behave identically to a single stack (that is, pop ( ) should return the same values as it would if there were just a single stack).
FOLLOW UP
ImplementafunctionpopAt(int index)whichperformsapopoperationonaspecificsub-stack.
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
    var next: Stack?
    var capacity = 2
    var count: Int{
        if self.isEmpty() == true {
            return 0
        } else {
            var result = 0
            var node = head!
            while let next = node.next{
                result += 1
                node = next
            }
            return result + 1
        }
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
    func push(_ v: Any) -> Stack? {
        let newNode = Node(v)
        if head == nil {
            head = newNode
            return self
        } 
        if ((count + 1) <= capacity) {
        newNode.next = head
        head = newNode
        return self
        } else {
        return nil
        }
    }
    func pop() -> Node? {
        if head == nil{
            return nil
        } else {
            let popped = head
            head = head!.next
            return popped
        }
    }
    func peek() -> Node? {
        if self.isEmpty() == true {
            return nil
        } else {
            return head
        }
    }
    func isEmpty() -> Bool {
        return head == nil
    }
}

struct SetOfStacks {
    var setHead: Stack?
    mutating func push(_ v: Any) -> SetOfStacks?{
        guard let stack = setHead else {
            let newStack = Stack()
            if newStack.count < newStack.capacity{
                print(newStack.push(v)!.head!.value as Any)
                setHead = newStack
                return self
            } else {
                return nil
            }
        }
        if stack.count < stack.capacity{
            print(stack.push(v)!.head!.value as Any)
            return self
        } else {
            let newStack = Stack()
            newStack.next = stack
            setHead = newStack
            print(newStack.push(v)!.head!.value as Any)
            return self
        }
    }
    mutating func pop() -> Node? {
        guard let stack = setHead else {
            return nil //no stack in set to pop off
        }
            if let headNode = stack.head{
                if let nextStack = stack.next{

                    switch stack.count {
                        case 1,0: 
                            setHead = nextStack
                        default: 
                            let poppedNode = headNode
                            if let nextNode = headNode.next {
                                stack.head = nextNode
                            }
                            return poppedNode
                    }
                    
                } else {

                }
                return headNode
            } else {
                return nil
            }
    }
}

// TESTING
var stack = Stack()
stack.push(5)
stack.push(10)
stack.push(15)
stack.printOut()
print("Is Empty? ", stack.isEmpty())
print("PEEK: ", stack.peek()!.value as Any)
print("COUNT: ", stack.count)
var stackSet = SetOfStacks()
stackSet.setHead = stack
stackSet.push(99)
stackSet.push(98)
stackSet.push(97)
stackSet.push(96)
stackSet.push(95)
print("Printout Head Stack: ")
stackSet.setHead!.printOut()
print("Popped: ", stackSet.pop()!.value)
print("Popped: ", stackSet.pop()!.value)
print("Popped: ", stackSet.pop()!.value)
print("Printout Head Stack: ")
stackSet.setHead!.printOut()
print("Is Empty? ", stackSet.setHead!.isEmpty())
print("PEEK: ", stackSet.setHead!.peek()!.value as Any)
print("COUNT: ", stackSet.setHead!.count)