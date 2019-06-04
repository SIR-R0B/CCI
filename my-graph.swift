/*
Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes. CCI 4.1
*/

struct Queue {

    var queueArray = [Vertex]()
    
    mutating func enqueue(_ a: Vertex) {
        queueArray.append(a)
    }

    mutating func dequeue() -> Vertex? {
        if let temp = queueArray.first {
            queueArray.remove(at: 0)
            return temp
        } else {
            return nil
        }
    }
}

struct Vertex: Hashable {
    var weight: Int
    var name: String
}

struct Edge: Hashable {
    var weight: Int
    var source: Vertex
    var destination: Vertex
}

class AdjacencyList {
    var dict = Dictionary<Vertex, [Edge]>()
//need to add the vertex to the dictionary
    func addEdge(_ s: Vertex, _ d: Vertex, _ w: Int) {
        let edge = Edge(weight: w, source: s, destination: d)

        if dict[s] == nil {
            dict[s] = [edge]
        } else {
            dict[s]?.append(edge)
        }
    }

    func getNeighbors(_ s: Vertex) -> [Vertex]? {
        guard let source = dict[s] else {
            return nil
        } 
        var result = [Vertex]()
        for edge in source {
            result.append(edge.destination)
        }
        return result
    }

    func breadthFirstSearch(_ a: Vertex, _ b: Vertex) -> Bool {

    var queue = Queue()
    queue.enqueue(a)

    var checked = [Vertex]()

    while let dequeued = queue.dequeue() {
        if dequeued == b {
            return true
        } else {
            checked.append(dequeued)
            if let neighbors = getNeighbors(dequeued) {
            for vertex in neighbors {
                if vertex == b {
                    return true //early exit
                }
                if !checked.contains(vertex){
                queue.enqueue(vertex)                
                }
            }
            }
        }
    }

    return false
    }
}

let rob = Vertex(weight: 33, name: "Rob")
let desi = Vertex(weight: 34, name: "Desi")
let arwyn = Vertex(weight: 2, name: "Arwyn")
let luba = Vertex(weight: 5, name: "Luba")

var family = AdjacencyList()

family.addEdge(rob, desi, 7)
family.addEdge(desi, rob, 7)
family.addEdge(rob, arwyn, 2)
family.addEdge(luba, desi, 1)

print(family.dict[rob] as Any)

print(family.getNeighbors(rob) as Any)

print(family.breadthFirstSearch(luba, arwyn) as Any)



