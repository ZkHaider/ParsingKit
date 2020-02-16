//
//  Parser.Prefix.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

public func prefix(while p: @escaping (Character) -> Bool) -> Parser<Substring> {
    return Parser<Substring> { str in
        let prefix = str.prefix(while: p)
        str.removeFirst(prefix.count)
        return prefix
    }
}
