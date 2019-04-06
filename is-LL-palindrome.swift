/*
Implement a function to check whether a Linked List is a palindrome
*/

class Node{
    var value: Character
    var next: Node?
    init(value: Character) {
        self.value = value
    }
}

class List{
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
    func append(_ v: Character){
        let newNode = Node(value: v)
        if let node = last{
            node.next = newNode
        } else{
            head = newNode
        }
    }
    func printOut(){
        guard var node = head else{
        return
        }
        print(node.value, terminator: "")
        while let next = node.next{
        print(next.value, terminator: "")
        node = next
        }
        print("")
    }
    func toString()->String{
        guard var node = head else{
        return ""
        }
        var tempString = ""
        tempString.append(node.value)
        while let next = node.next{
        tempString.append(next.value)
        node = next
        }
        return tempString
    }
}

let leftList = List()
let rightList = List()

leftList.append("A")
leftList.append("b")
leftList.append("e")

rightList.append("e")
rightList.append("b")
rightList.append("A")
//rightList.append("d")

/*leftList.printOut()
rightList.printOut()
print(leftList.toString())
print(rightList.toString())
*/

func isPalindrome(_ l: List, _ r: List) -> Bool{

    if String(l.toString().reversed()) == r.toString(){
        return true
    } else { 
        return false
    }

}
print(isPalindrome(leftList,rightList))
