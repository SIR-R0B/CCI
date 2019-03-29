/*
Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. lf x is contained within the list, the values of x only need to be after the elements less than x (see below).The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
*/

class Node{
    var value: Int 
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

extension Node: Equatable {
    static func == (l: Node, r: Node) -> Bool {
            return 
                l.value == r.value
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
    func append(_ v: Int){
        let newNode = Node(value: v)
        if let node = last{
            node.next = newNode
        } else{
            head = newNode
        }
    }  
    func shift(_ v: Int){
        let newNode = Node(value: v)
        if let node = first{
            newNode.next = node
        } else{
            head = newNode
        }
    }
    func delete(_ n : Node){
        guard var node = head else{
            return
        }
        while var next = node.next{
            if next == n{
                if let newNext = n.next{
                next = newNext
                }
                break
            }else{
                node = next
            }
        }
            self.printOut()
    }
    func printOut(){
        guard var node = head else{
            print("Empty List")
            return
        }
        print(node.value)
        while let next = node.next{
            print(next.value)
            node = next
        }
    }

}

func partition(_ l: List, _ n: Int) -> List{

        var leftList = List()
        var rightList = List()
        func split(_ v: Int){
            if v < n{
            leftList.append(v)
        } else{
            rightList.append(v)
        }
        }
        func join(_ a: List, _ b: List) -> List{
            let result = List()
            guard var nodeLeft = a.head else{
                return l
            }
            guard var nodeRight = b.head else{
                return l
            }
            result.append(nodeLeft.value)
            while let next = nodeLeft.next{
                result.append(next.value)
                nodeLeft = next
            }
            result.append(nodeRight.value)
            while let next = nodeRight.next{
                result.append(next.value)
                nodeRight = next
            }
            return result
        }
        guard var node = l.head else{
            return l
        }
        split(node.value)
        while let next = node.next{
            split(next.value)
            node = next
        } 
        let joinedList = join(leftList,rightList)
        return joinedList
    }


var list = List()
list.append(1)
list.append(9)
list.append(6)
list.append(100)
list.append(3)
list.append(33)
list.append(75)
list.append(25)
list.append(32)
list.append(3)
list.append(1)

print("Count: \(list.count)")

list.printOut()

print("End List")

list = partition(list,32) 


print("finished program")
list.printOut()

/*

The solution is for a singly linked list and features a split where I divide the original list into two lists, based on the partition, and then merge them together at the end.

*/