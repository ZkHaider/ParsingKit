//
//  Parser.Atomic.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser {
    
    public static var never: Parser {
        return Parser { _ in nil }
    }
    
    public static func always<A>(_ a: A) -> Parser<A> {
        return Parser<A>(run: { (substring) -> A? in
            return a
        })
    }
    
    public static func literal(_ literal: String) -> Parser<Void> {
        return Parser<Void> { str in
            guard str.hasPrefix(literal) else { return nil }
            str.removeFirst(literal.count)
            return ()
        }
    }
    
}

extension Parser where T == Void {
    
    public static let optionalSpaces: Parser<Void> = {
        return prefix(while: { $0 == " "})
            .map { _ in () }
    }()
    
    public static let multiSpace: Parser<Void> = {
        return prefix(while: { $0 == " " })
            .flatMap { $0.isEmpty ? .never : Parser.always(()) }
    }()
    
}
