/*
Implement an algorithm to delete a node in the middle (i.e., any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
EXAMPLE
Input: the node c from the linked list a - >b- >c - >d - >e- >f
Result: nothing is returned, but the new linked list looks like a - >b- >d - >e- >f
*/

class Node{
    var value: Character
    var next: Node?
    init(value: Character){
        self.value = value
    }
    deinit {
        print("\(value) is being deinitialized properly.")
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool{
        return 
            lhs.value == rhs.value &&
            lhs.next == rhs.next
    }
}

class List{
    var head: Node?
    var first: Node?{
        return head
    }
    var last: Node?{
        guard var node = head else{
            return nil
        }
        while let next = node.next{
            node = next
        }
        return node
    }
    var count: Int{
        guard var node = head else{
            return 0
        }
        var count = 1
        while let next = node.next{
            node = next
            count += 1
        }
        return count
    }
    func append(_ v: Character){

        let newNode = Node(value: v)

        if let node = last{
             node.next = newNode
        } else {
            head = newNode
        }
    }
    func getNode(_ v: Character) -> Node? {
        
        guard var node = head else{
            return nil
        }
        if node.value == v{
            return head
        }
            while let next = node.next{
            if next.value == v{
                return next
            } else{
            node = next
            }
            } 
            return nil
    }
    func delete(_ n: Node?) -> String{
        var result = "Not Deleted"
        guard var node = head else{
            return result
        }
        while let next = node.next{
            if next == n!{
                node.next = n!.next
                result = "Deleted"
                break
            } else{
                node = next
            }
        }
        return result
    }
    func printOut(){
        guard var node = head else{
            return
        }
        print(node.value)
        while let next = node.next{
            print(next.value)
            node = next
        }
        return
    }


}

let list = List()
list.append("a")
list.append("b")
list.append("c")
list.append("d")
list.append("e")
list.append("f")

print(list.count)
print(list.head!)
print(list.last!)

//print(list.delete(list.getNode("c"))) //my original implementation, which used the head, works

func gayle(_ n: inout Node){
    guard let node = n.next else{
        return
    }
    n.value = node.value
    n.next = node.next //copy over the next node in the list
}


if var obj = list.getNode("c") {
gayle(&obj)
}


print(list.count)
list.printOut()

/*
For my solution I needed to conform to the equatable protocol (NEW!) and then implement a method to get a node from a linked list. Once I had the node, then I could pass it to my delete method and take care of business. Also decided to implement a print out method for viewing contents of my linked list.

Gayle Solution:
I see I misunderstood the problem- the idea is you are given a node, but don't have acess to the head of the list. So in this case the solution is to copy over the data from the next node to the given node, then remove the next node. *Note this won't work for the tail node, but you could mark it as dummy
*/