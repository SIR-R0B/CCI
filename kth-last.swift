/*
Return Kth to Last: Implement an algorithm to find the kth to last element of a singly linked list.
*/

class Node {
    var value: Int
    var next: Node?
    init(value: Int){
    self.value = value  
    }
}

class List {
    var head: Node?
    var tail: Node?
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
    var isEmpty: Bool{
        return head == nil
    }
    var count: Int?{
        guard var node = head else{
            return 0
        }
        var count = 1
        while let next = node.next{
            count += 1
            node = next
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
}
/*
var list = List()
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)

print(list.first!.value) //1
print(list.last!.value) //5
print(list.count!) //5
print(list.isEmpty) //false

 //Test my original implementation
func findKth(_ l: List, _ k: Int)-> Int {

    var result = Int()

    if l.isEmpty == true || k > l.count! {return -1}

    var count = 1
    var node = l.head
    
    while count < l.count!-k{
        node = node!.next    
        count += 1
    }
    result = node!.value
    return result

}

print(findKth(list, 3)) //2
*/

/*
Gayle Solution: 
'Equally acceptable to define k = 0 as last element *which I have done here'
Solution 1 = when the length of the list is known return (length - k)th element
-- because it's so trivial we can almost be sure this is not what the interviewer wanted. Ask them.
Solution 2 = recursively call, each parent call adds one to a counter, when counter == k, you've hit the kth element
Solution 3 = two pointers placed k units apart, when the rightmost pointer hits the end, the left most pointer is on the money
*/

//Solution 3

func gayle3(_ l: List, _ k: Int) -> Int {
    
    var p1 = l.head
    var p2 = l.head

    if k != 0 {
        for _ in 1...k{
        guard let node = p1 else{
            break
        }
        p1 = node.next
    }
    }

    while let node = p1?.next{
        p1 = node
        p2 = p2?.next
    }
    return p2!.value
}

var list = List()
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)

print(list.first!.value) //1
print(list.last!.value) //5
print(list.count!) //5
print(list.isEmpty) //false

print(gayle3(list, 3)) //2
