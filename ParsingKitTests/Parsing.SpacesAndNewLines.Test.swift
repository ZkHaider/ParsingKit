//
//  Parsing.SpacesAndNewLines.Test.swift
//  ParsingKitTests
//
//  Created by Haider Khan on 8/16/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import XCTest
import ParsingKit

final class SpacesAndNewLinesTest: XCTestCase {
    
    func testSpacesAndNewLines() {
        let string = "hello \n world"
        let parser = zeroOrMore(
            .text,
            separatedBy: .whitespacesAndNewLines
        )
        
        let results = parser.run(string).match!
        assert(
            results[0] == "hello" &&
            results[1] == "world" &&
            results.count == 2
        )
    }
    
}
