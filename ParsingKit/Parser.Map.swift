//
//  Parser.Map.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser {
    public func map<A>(_ f: @escaping (T) -> A) -> Parser<A> {
        return Parser<A>{ substring -> A? in
            self.run(&substring).map(f)
        }
    }
    
    public func flatMap<A>(_ f: @escaping (T) -> Parser<A>) -> Parser<A> {
        return Parser<A> { substring -> A? in
            let original = substring
            let matchT = self.run(&substring)
            let parserA = matchT.map(f)
            guard let matchA = parserA?.run(&substring) else {
                substring = original
                return nil
            }
            return matchA
        }
    }
}
