/*
 An animal shelter, which holds only dogs and cats, operates on a strictly"first in, first out" basis. People must adopt either the "oldest" (based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot select which specific animal they would like. Create the data structures to maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog, and dequeueCat. You may use the built-in Linked List data structure.
*/

import Foundation //needed for logging enqueue time as Date()

class Animal {
    let name: String
    let type: String           // make this an enum on refactor
    let arrivalTime = Date()
    var next: Animal?
    init(_ name: String,_ type: String) {
        self.name = name.lowercased()
        self.type = type.lowercased()
    }
}

class Queue {
    var head: Animal?
    var last: Animal? {
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
        while let next = node.next {
            print(node.name)
            node = next
        }
        print(node.name)
    }
    func enqueue(_ name: String, _ animalType: String) {
        let newAnimal = Animal(name, animalType)
        guard let node = head else {
            head = newAnimal
            return
        }
        newAnimal.next = node
        head = newAnimal
    }
    func dequeueAny() -> Animal? {
    
    let dequeued = last
    
        guard var node = head else {
            return nil
        }
        while let next = node.next{

            if next === dequeued{
                break
            }
            node = next
        }
    node.next = nil
    return dequeued
    }
    func dequeueCat() -> Animal? {
    
    let copy = Queue()
    var lastCat: Animal?

    if let animal = last, animal.type == "cat" {
    
    lastCat = animal
    
    } else {
        // find the last cat
        guard var node = head else {
            return nil
        } 

        if node.type == "cat"{
                    lastCat = node
                    let newAnimal = Animal(node.name, node.type)
                    if copy.head == nil{
                    copy.head = newAnimal
                         } else {
                            if let lastNode = copy.last {
                         lastNode.next = newAnimal
                             }                    
                        }
                    }

        while let next = node.next{
                let newAnimal = Animal(node.name, node.type)
                if copy.head == nil{
                    copy.head = newAnimal
                } else {
                if node.type == "cat"{
                    lastCat = node
                    }
                if let lastNode = copy.last {
                    lastNode.next = newAnimal
                    }                    
                }
            node = next
            }
        }

        //cycle through and pluck out the last cat from self
    guard var node = head else {
        return nil
    }

    if let dequeueCat = lastCat, node === dequeueCat {
        if let next = node.next{
        head = next
        } else {
        head = nil
        }
        return lastCat
    }

    while let next = node.next{
        if let dequeueCat = lastCat, next === dequeueCat{
            node.next = dequeueCat.next
            break
        }
        node = next
    }
    return lastCat
    }

    func dequeueDog() -> Animal? {
    
    let copy = Queue()
    var lastDog: Animal?

    if let animal = last, animal.type == "dog" {
    
    lastDog = animal
    
    } else {
        // find the last dog
        guard var node = head else {
            return nil
        } 
        
        if node.type == "dog"{
                    lastDog = node
                    let newAnimal = Animal(node.name, node.type)
                    if copy.head == nil{
                    copy.head = newAnimal
                         } else {
                            if let lastNode = copy.last {
                         lastNode.next = newAnimal
                             }                    
                        }
                    }

        while let next = node.next{
                let newAnimal = Animal(node.name, node.type)
                if copy.head == nil{
                    copy.head = newAnimal
                } else {
                if node.type == "dog"{
                    lastDog = node
                    }
                if let lastNode = copy.last {
                    lastNode.next = newAnimal
                    }                    
                }
            node = next
            }
        }
        //cycle through and pluck out the last dog from self
    guard var node = head else {
        return nil
    }

    if let dequeueDog = lastDog, node === dequeueDog {
        if let next = node.next{
        head = next
        } else {
        head = nil
        }
        return lastDog
    }

    while let next = node.next{
        if let dequeueDog = lastDog, next === dequeueDog{
            node.next = dequeueDog.next
            break
        } 
        node = next
    }
    return lastDog
    }


}

let myQueue = Queue()

myQueue.enqueue("Fido","Dog")
myQueue.enqueue("rufus","dog")
myQueue.enqueue("fluffy","cat")
myQueue.enqueue("luba","Cat")
myQueue.enqueue("hazel","Cat")
myQueue.enqueue("penny","dog")

print("-----Printout-----")
myQueue.printOut()
print("-----End Printout 1-----")
print(myQueue.dequeueAny()!.name)
print("-----Printout-----")
myQueue.printOut()
print("-----End Printout 2-----")
print(myQueue.dequeueCat()!.name)
print("-----Printout-----")
myQueue.printOut()
print("-----End Printout 3-----")
print(myQueue.dequeueDog()!.name)
print("-----Printout-----")
myQueue.printOut()
print("-----End Printout 4-----")
print(myQueue.dequeueDog()!.name)
print("-----Printout-----")
myQueue.printOut()
print("-----End Printout 5-----")
