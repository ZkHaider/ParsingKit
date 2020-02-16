//
//  Parser.Array.swift
//  ParsingKit
//
//  Created by Haider Khan on 8/16/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public func zeroOrMore<A>(
    _ parser: Parser<A>,
    separatedBy separator: Parser<Void>) -> Parser<[A]> {
    return Parser<[A]> { str in
        var rest = str
        var matches: [A] = []
        while
            !str.isEmpty,
            let match = parser.run(&str) {
            rest = str
            matches.append(match)
            if separator.run(&str) == nil {
                return matches
            }
        }
        str = rest
        return matches 
    }
}
