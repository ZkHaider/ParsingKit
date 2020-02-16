//
//  Parser.Float.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser where T == Float {
    
    public static let float: Parser<T> = {
        return Parser<T>(run: { substring -> Float? in
            let prefix = substring.prefix(while: { $0.isNumber || $0 == "." })
            guard let match = Float(prefix) else { return nil }
            substring.removeFirst(prefix.count)
            return match
        })
    }()
    
    public static let percentage: Parser<T> = {
        return zip(
            .optionalSpaces,
            .float,
            .optionalSpaces,
            .percent
        ).map { _, float, _, _ in
            return float / 100.0
        }
    }()
    
}
