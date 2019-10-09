//
//  HomologyTests.swift
//  SwiftyMathTests
//
//  Created by Taketo Sano on 2017/11/10.
//  Copyright © 2017年 Taketo Sano. All rights reserved.
//

import XCTest
import SwiftyMath
import SwiftyHomology
@testable import SwiftyTopology

extension IntegerQuotientRing: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(from: value)
    }
}

extension RationalNumber: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}


class SimplicialHomologyTests: XCTestCase {
    
    func testD3_Z() {
        let K = SimplicialComplex.ball(dim: 3)
        let H = K.homology(𝐙.self)
        
        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
        XCTAssertEqual(H[3].dictionaryDescription, [:])
    }
    
    func testS2_Z() {
        let K = SimplicialComplex.sphere(dim: 2)
        let H = K.homology(𝐙.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testD3_S2_Z() {
        let K = SimplicialComplex.ball(dim: 3)
        let L = K.skeleton(2)
        let H = K.homology(relativeTo: L, 𝐙.self)

        XCTAssertEqual(H[0].dictionaryDescription, [:])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
        XCTAssertEqual(H[3].dictionaryDescription, [0 : 1])
    }

    func testT2_Z() {
        let K = SimplicialComplex.torus(dim: 2)
        let H = K.homology(𝐙.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [0 : 2])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testRP2_Z() {
        let K = SimplicialComplex.realProjectiveSpace(dim: 2)
        let H = K.homology(𝐙.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [2 : 1])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
    }

    func testD3_Z2() {
        let K = SimplicialComplex.ball(dim: 3)
        let H = K.homology(𝐙₂.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
    }

    func testS2_Z2() {
        let K = SimplicialComplex.sphere(dim: 2)
        let H = K.homology(𝐙₂.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testD3_S2_Z2() {
        let K = SimplicialComplex.ball(dim: 3)
        let L = K.skeleton(2)
        let H = K.homology(relativeTo: L, 𝐙₂.self)

        XCTAssertEqual(H[0].dictionaryDescription, [:])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
        XCTAssertEqual(H[3].dictionaryDescription, [0 : 1])
    }

    func testT2_Z2() {
        let K = SimplicialComplex.torus(dim: 2)
        let H = K.homology(𝐙₂.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [0 : 2])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testRP2_Z2() {
        let K = SimplicialComplex.realProjectiveSpace(dim: 2)
        let H = K.homology(𝐙₂.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testD3_Q() {
        let K = SimplicialComplex.ball(dim: 3)
        let H = K.homology(𝐐.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
        XCTAssertEqual(H[3].dictionaryDescription, [:])
    }

    func testS2_Q() {
        let K = SimplicialComplex.sphere(dim: 2)
        let H = K.homology(𝐐.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testD3_S2_Q() {
        let K = SimplicialComplex.ball(dim: 3)
        let L = K.skeleton(2)
        let H = K.homology(relativeTo: L, 𝐐.self)


        XCTAssertEqual(H[0].dictionaryDescription, [:])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
        XCTAssertEqual(H[3].dictionaryDescription, [0 : 1])
    }

    func testT2_Q() {
        let K = SimplicialComplex.torus(dim: 2)
        let H = K.homology(𝐐.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [0 : 2])
        XCTAssertEqual(H[2].dictionaryDescription, [0 : 1])
    }

    func testRP2_Q() {
        let K = SimplicialComplex.realProjectiveSpace(dim: 2)
        let H = K.homology(𝐐.self)

        XCTAssertEqual(H[0].dictionaryDescription, [0 : 1])
        XCTAssertEqual(H[1].dictionaryDescription, [:])
        XCTAssertEqual(H[2].dictionaryDescription, [:])
    }
}
