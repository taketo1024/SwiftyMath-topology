//
//  Simplex.swift
//  SwiftyAlgebra
//
//  Created by Taketo Sano on 2017/05/03.
//  Copyright © 2017年 Taketo Sano. All rights reserved.
//

import Foundation

public struct Vertex: Equatable, Comparable, Hashable, CustomStringConvertible {
    public let id: String
    internal let index: Int
    
    internal init(_ id: String, _ index: Int) {
        self.id = id
        self.index = index
    }
    
    public var hashValue: Int {
        return id.hashValue
    }
    
    public var description: String {
        return id
    }
    
    public static func ==(a: Vertex, b: Vertex) -> Bool {
        return a.id == b.id
    }
    
    public static func <(a: Vertex, b: Vertex) -> Bool {
        return a.index < b.index
    }
}

public struct VertexSet: CustomStringConvertible {
    public let vertices: [Vertex]
    public init(number: Int, prefix: String = "v") {
        self.vertices = (0 ..< number).map { Vertex("\(prefix)\($0)", $0) }
    }
    
    public func simplex(_ indices: Int...) -> Simplex {
        let vs = indices.map { vertices[$0] }
        return Simplex(vs)
    }
    
    public var description: String {
        return vertices.description
    }
}

// MEMO: 'un'ordered set of vertices (though we use OrderedSet)

public struct Simplex: Equatable, Hashable, CustomStringConvertible {
    public let vertices: OrderedSet<Vertex>
    public var dim: Int {
        return vertices.count - 1
    }
    
    internal init<S: Sequence>(_ vertices: S) where S.Iterator.Element == Vertex {
        self.vertices = OrderedSet(sequence: vertices.sorted())
    }
    
    public func face(_ index: Int) -> Simplex {
        let vs = (0 ... dim).filter({$0 != index}).map{vertices[$0]}
        return Simplex(vs)
    }
    
    public func faces() -> [Simplex] {
        return (0 ... dim).map{ face($0) }
    }
    
    public func contains(_ s: Simplex) -> Bool {
        return s.vertices.isSubset(of: self.vertices)
    }
    
    public func allSubsimplices() -> [Simplex] {
        var queue = OrderedSet(sequence: [self])
        var i = 0
        while(i < queue.count) {
            let s = queue[i]
            if s.dim > 0 {
                queue += queue[i].faces()
            }
            i += 1
        }
        return Array(queue)
    }
    
    public var hashValue: Int {
        return description.hashValue
    }
    
    public var description: String {
        return Array(vertices).description
    }
    
    public static func ==(a: Simplex, b: Simplex) -> Bool {
        return Set(a.vertices) == Set(b.vertices)
    }
}
