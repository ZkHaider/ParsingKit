//
//  Parser.Double.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser where T == Double {
    public static let double: Parser<T> = {
        return Parser<T>(run: { substring -> Double? in
            let prefix = substring.prefix(while: { $0.isNumber || $0 == "." })
            guard let match = Double(prefix) else { return nil }
            substring.removeFirst(prefix.count)
            return match
        })
    }()
}
