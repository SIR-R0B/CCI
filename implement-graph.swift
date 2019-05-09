/*
Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
*/

// create generic Queue struct with enqueue and dequeue methods

 struct Queue<T> {
    var items: [T] = []
    mutating func enqueue(element: T){
        items.append(element)
    }
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
}

// enum for breadthFirstSearch visits

 enum Visit<Element: Hashable> {
    case source, edge(Edge<Element>)
}

// simple protocol-oriented implementation of a graph

// create enum for edgeType
 enum EdgeType {
    case directed, undirected
}
// create struct for vertex
 struct Vertex<T: Hashable> : Hashable {
    var data: T
}
// extend vertex struct to confirm to customstringconvertible protocol
extension Vertex: CustomStringConvertible {
     var description: String {
        return "\(data)"
    }
}
// create edge struct
 struct Edge<T: Hashable> : Hashable {
     var source: Vertex<T>
     var destination: Vertex<T>
     var weight: Double?
}
// create graphable protocol

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }

    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

// extend Graphable for breadth-first search

extension Graphable {

     func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(element: source)

        var visits : [Vertex<Element> : Visit<Element>] = [source : .source]

        while let visitedVertex = queue.dequeue(){
            if visitedVertex == destination {
                var vertex = destination
                var route: [Edge<Element>] = []

                while let visit = visits[vertex],
                case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.source
                }
                return route
            }
            let neighborEdges = edges(from: visitedVertex) ?? []
            for edge in neighborEdges {
                if visits[edge.destination] == nil {
                    queue.enqueue(element: edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
            }
        }
        return nil
    }
}

// create adjacencyList class

open class AdjacencyList<T: Hashable> {
     var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
     init(){}

    func addDirected(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    func addUndirected(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
    let (source, destination) = vertices
    addDirected(from: source, to: destination, weight: weight)
    addDirected(from: destination, to: source, weight: weight)
    }
}

// conform adjacencyList to graphable protocol
extension AdjacencyList: Graphable {
    typealias Element = T

    var description: CustomStringConvertible {

        var result = ""

        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated(){
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) -> [ \(edgeString) ] \n")
        }


        return result
     }

    func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        if adjacencyDict[vertex] == nil{
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch type {
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
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
        return adjacencyDict[source]
    }
}

//test data
var al = AdjacencyList<String>()

let rob = al.createVertex(data: "Rob")
let desi = al.createVertex(data: "Desi")
let arwyn = al.createVertex(data: "Arwyn")
let luba = al.createVertex(data: "Luba")
let poop = al.createVertex(data: "Poop")
let foo = al.createVertex(data: "Foo")



al.add(.directed, from: arwyn, to: desi, weight: 7)
al.add(.directed, from: desi, to: rob, weight: 7)
al.add(.directed, from: desi, to: poop, weight: 7)
al.add(.directed, from: desi, to: foo, weight: 7)
al.add(.directed, from: foo, to: desi, weight: 7)
al.add(.directed, from: poop, to: rob, weight: 7)
al.add(.directed, from: rob, to: luba, weight: 2)
al.add(.directed, from: luba, to: rob, weight: 0)

print(al.description)

print(al.breadthFirstSearch(from: poop, to: luba) as Any)


