//
//  Parser.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public struct Parser<T> {
    let run: (inout Substring) -> T?
}

extension Parser {
    public func run(_ str: String) -> (match: T?, rest: Substring) {
        var str = str[...]
        let match = self.run(&str)
        return (match, str)
    }
}
