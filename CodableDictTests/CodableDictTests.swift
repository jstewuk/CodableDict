//
//  CodableDictTests.swift
//  CodableDictTests
//
//  Created by James Stewart on 3/20/20.
//  Copyright © 2020 James Stewart. All rights reserved.
//

import XCTest
@testable import CodableDict
@testable import DictionaryCoding

class CodableDictTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEncoding() throws {
        struct Pet : Codable {
          let name : String
        }

        struct Person : Codable {
          let name : String
          let age : Int
          let pets : [Pet]
        }

        // to encode...
        let test = Person(name: "Sam", age: 48, pets:[Pet(name: "Morven"), Pet(name: "Rebus")])
        let encoder = DictionaryCoding.DictionaryEncoder()
        let encoded = try encoder.encode(test) as [String:Any]
        XCTAssertEqual(encoded["name"] as? String, "Sam")
        XCTAssertEqual(encoded["age"] as? Int, 48)
        let pets = encoded["pets"] as! [NSDictionary]
        XCTAssertEqual(pets[0]["name"] as? String, "Morven")
        XCTAssertEqual(pets[1]["name"] as? String, "Rebus")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
