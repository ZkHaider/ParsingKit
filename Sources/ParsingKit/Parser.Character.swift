//
//  Parser.Character.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser where T == Character {
    public static let char: Parser<T> = {
        return Parser<T>(run: { substring -> Character? in
            guard !substring.isEmpty else { return nil }
            return substring.removeFirst()
        })
    }()
}
