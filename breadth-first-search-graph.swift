// create generic Queue struct with enqueue and dequeue methods

struct Queue<T: Hashable> {
    //create empty queue
    var items: [T] = []
    // create enqueue and dequeue methods
    mutating func enqueue(element: T) {
        items.append(element)
    }
    mutating func dequeue() -> T? {
        if let temp = items.first{
            items.remove(at: 0)
            return temp
        } else {
            return nil
        }
    }
}

// enum for breadthFirstSearch Visits

enum Visit<Element: Hashable> {
    case source, edge(Edge<Element>)
}
// create enum for EdgeType, no need to have generic types or associated values on the cases

enum EdgeType {
    case directed, undirected
}

// create struct for Vertex, the generic type needs to be hashable, as well as the Vertex struct

struct Vertex<T: Hashable> : Hashable {
    var data: T
}

// extend vertex struct to conform to customstringconvertible protocol

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(data)" // another way to write this is String(describing: data)
    }
}

// create Edge struct

struct Edge<T: Hashable> : Hashable {
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double?
}

// create graphable protocol, with associatedtype that conforms to hashable, a variable description that conforms to customstringconvertible and is read-only

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get } //read-only property

    func createVertex(data: Element) -> Vertex<Element>
    func addEdge(_ edgeType: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

// extend Graphable for breadth-first search
    extension Graphable {
        func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
            //create queue for vertices
            var queue = Queue<Vertex<Element>>()
            queue.enqueue(element: source)

            //create Visits dictionary
            var visits : [Vertex<Element> : Visit<Element>] = [source : .source]

            //begin loop, while you can dequeue from the queue...

            while let visitedVertex = queue.dequeue(){
                if destination == visitedVertex {
                    var vertex = destination
                    var route = [Edge<Element>]()

                    while let visit  = visits[vertex], case .edge(let edge) = visit {
                        //route = [edge] + route
                        route.append(edge)
                        vertex = edge.source
                    }
                    return route.reversed()
                } else {
                    let neighborEdges = edges(from: visitedVertex) ?? []
                    for edge in neighborEdges {
                        if visits[edge.destination] == nil {
                            queue.enqueue(element: edge.destination)
                            visits[edge.destination] = .edge(edge)
                        }
                    }
                }
            }
            return nil

        }
    }

// create adjacencyList class of a generic type T that is hashable

class AdjacencyList<T: Hashable> {
    
        var adjacencyDict = Dictionary<Vertex<T>, [Edge<T>]>()
        // var adjacencyDict : [Vertex<T> : [Edge<T>]] = [:]
    
    func addDirected(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        //create the edge and append it to the adjacencyDict
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    func addUndirected(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?){
        let (a, b) = vertices
        addDirected(from: a, to: b, weight: weight)
        addDirected(from: b, to: a, weight: weight)
    }
}

// conform adjacencyList to graphable protocol, with a typealias Element set to T

extension AdjacencyList: Graphable {
    typealias Element = T
    var description: CustomStringConvertible { 
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for edge in edges {
                edgeString.append(String(describing: edge.destination))
                edgeString.append(" ")
            }
            result.append("\(vertex) -> [ \(edgeString) ] \n")
        }
        return result
     } 

    func createVertex(data: Element) -> Vertex<Element> {
        let newVertex = Vertex(data: data)
        if adjacencyDict[newVertex] == nil{
            adjacencyDict[newVertex] = []
        }
        return newVertex
    }
    func addEdge(_ edgeType: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edgeType {
            case .directed:
                addDirected(from: source, to: destination, weight: weight)
            case .undirected:
                addUndirected(vertices: (source, destination), weight: weight)
        }
    }
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        for edge in edges {
            if edge.destination == destination{
            return edge.weight
            }
        }
        return nil
    }
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        return edges
    }

}
// test data

//test data
var al = AdjacencyList<String>()

let rob = al.createVertex(data: "Rob")
let desi = al.createVertex(data: "Desi")
let arwyn = al.createVertex(data: "Arwyn")
let luba = al.createVertex(data: "Luba")
let goop = al.createVertex(data: "Goop")
let foo = al.createVertex(data: "Foo")



al.addEdge(.directed, from: arwyn, to: desi, weight: 7)
al.addEdge(.directed, from: desi, to: rob, weight: 7)
al.addEdge(.directed, from: desi, to: goop, weight: 7)
al.addEdge(.directed, from: desi, to: foo, weight: 7)
al.addEdge(.directed, from: foo, to: desi, weight: 7)
al.addEdge(.directed, from: goop, to: rob, weight: 7)
al.addEdge(.directed, from: rob, to: luba, weight: 2)
al.addEdge(.directed, from: luba, to: rob, weight: 0)

print(al.description)

print(al.breadthFirstSearch(from: goop, to: luba) as Any)