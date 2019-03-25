/*Remove Dups: Write code to remove duplicates from an unsorted linked list. FOLLOW UP
How would you solve this problem if a temporary buffer is not allowed?
*/

class Node{
    var value: Int
    var next: Node?
    init(value: Int){
        self.value = value
    }
}

class LinkedList{
    var head: Node?
    var isEmpty: Bool{
        return head == nil
    }
    var first: Node?{
        return head
    }
    var last: Node?{
        guard var node = head else{
            return nil // guards against a nil head, in which case there is no last, and returns last 
        }
        while let next = node.next{ //if you can unwrap node.next, then store it in next
            node = next //set the current 'node var', hence guard var vs. guard let above..., to the successfully unwrapped node.next
        }
        return node
    }
    func append(_ v: Int){
        let node = Node(value: v)
        if let lastNode = last{
            lastNode.next = node
        } else{
            head = node
        }
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
    
}
// make it a method? do it using temp?
func removeDups(_ l: LinkedList) -> LinkedList{

var listValues = [Int]()

guard var node = l.first!.next else{
    print("0")
    return l
}

print(l.first!.value)
var max = l.first!.value
listValues.append(l.first!.value)

while let next = node.next{
    print(node.value) // loop won't print last in linked list because it won't unwrap
    if max < node.value{
        max = node.value
    }
    listValues.append(node.value)
    node = next
}

print(l.last!.value)
if l.last!.value > max{
    max = l.last!.value
}
listValues.append(l.last!.value)

print("Max: \(max)")
var hashed = [Int](repeating: 0, count: max+1)

for i in 0..<listValues.count{
    hashed[listValues[i]] += 1
}
var a = [Int]()
for i in 0..<hashed.count{
    if hashed[i] == 1{
        a.append(i)
    }
}

print(listValues)
print(hashed)
print(a)

return l
}

let list = LinkedList()
list.append(42)
list.append(99)
list.append(42)
list.append(1)
list.append(2)

//print(list.last!.value)
//print(list.count)

//print("returns: \(removeDups(list))")


func removeDuplicates(_ l: LinkedList) -> LinkedList {
    var listSet = Set<Int>()
    var newList = LinkedList()

    guard var node = l.first!.next else{
    print("0")
    return l
}
    while let next = node.next{
    print(node.value) // loop won't print last in linked list because it won't unwrap
    listSet.insert(node.value)
    node = next
}
    print(listSet.reversed())

for each in listSet{
    newList.append(each) 
}
print(newList.count)
    return newList
}

print("returns: \(removeDuplicates(list))")