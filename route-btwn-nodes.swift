/*
Route Between Nodes: Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
*/

public enum EdgeType {
    case directed, undirected
}

public struct Vertex<T: Hashable> : Hashable {
    var data: T
}
extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

public struct Edge<T: Hashable> : Hashable {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public var weight: Double? 
}

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }

    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}

fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
    let edge = Edge(source: source, destination: destination, weight: weight)
    adjacencyDict[source]?.append(edge)
}

fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
  let (source, destination) = vertices
  addDirectedEdge(from: source, to: destination, weight: weight)
  addDirectedEdge(from: destination, to: source, weight: weight)
}

}

extension AdjacencyList: Graphable {
    public typealias Element = T

    public var description: CustomStringConvertible {
  var result = ""
  for (vertex, edges) in adjacencyDict {
    var edgeString = ""
    for (index, edge) in edges.enumerated() {
      if index != edges.count - 1 {
        edgeString.append("\(edge.destination), ")
      } else {
        edgeString.append("\(edge.destination)")
      }
    }
    result.append("\(vertex) ---> [ \(edgeString) ] \n ")
  }
  return result
}

    public func createVertex(data: Element) -> Vertex<Element> {
    let vertex = Vertex(data: data)
    if adjacencyDict[vertex] == nil{
        adjacencyDict[vertex] = []
    }
    return vertex
}

public func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
  switch type {
  case .directed:
    addDirectedEdge(from: source, to: destination, weight: weight)
  case .undirected:
    addUndirectedEdge(vertices: (source, destination), weight: weight)
  }
}

public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
  guard let edges = adjacencyDict[source] else { // 1
    return nil
  }
  
  for edge in edges { // 2
    if edge.destination == destination { // 3
      return edge.weight
    }
  }
  
  return nil // 4
}

public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
  return adjacencyDict[source]
}


}






let adjacencyList = AdjacencyList<String>()

let singapore = adjacencyList.createVertex(data: "Singapore")
let tokyo = adjacencyList.createVertex(data: "Tokyo")
let hongKong = adjacencyList.createVertex(data: "Hong Kong")
let detroit = adjacencyList.createVertex(data: "Detroit")
let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
let washingtonDC = adjacencyList.createVertex(data: "DC")
let austinTexas = adjacencyList.createVertex(data: "Austin")
let seattle = adjacencyList.createVertex(data: "Seattle")

adjacencyList.add(.directed, from: singapore, to: hongKong, weight: 300)
adjacencyList.add(.directed, from: singapore, to: tokyo, weight: 500)
adjacencyList.add(.directed, from: hongKong, to: tokyo, weight: 250)
adjacencyList.add(.directed, from: tokyo, to: detroit, weight: 450)
adjacencyList.add(.directed, from: tokyo, to: washingtonDC, weight: 300)
adjacencyList.add(.directed, from: hongKong, to: sanFrancisco, weight: 600)
adjacencyList.add(.directed, from: detroit, to: austinTexas, weight: 50)
adjacencyList.add(.directed, from: austinTexas, to: washingtonDC, weight: 292)
adjacencyList.add(.directed, from: sanFrancisco, to: washingtonDC, weight: 337)
adjacencyList.add(.directed, from: washingtonDC, to: seattle, weight: 277)
adjacencyList.add(.directed, from: sanFrancisco, to: seattle, weight: 218)
adjacencyList.add(.directed, from: austinTexas, to: sanFrancisco, weight: 297)

print(adjacencyList.description)





