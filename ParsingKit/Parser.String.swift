//
//  Parser.String.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser where T == String {
    
    public static let text: Parser<T> = {
        return prefix(while: { $0 != " " && $0 != "\n" })
            .map({ String($0) })
    }()
    
    public static let leftCurlyBrace: Parser<T> = {
        return Parser<T>(run: { substring -> String? in
            guard
                let prefix = substring.first(where: { $0 == "{" }),
                let index = substring.firstIndex(where: { $0 == "{" })
                else { return nil }
            let match = String(prefix)
            substring.remove(at: index)
            return match
        })
    }()
    
    public static let rightCurlyBrace: Parser<T> = {
        return Parser<T>(run: { substring -> String? in
            guard
                let prefix = substring.first(where: { $0 == "}" }),
                let index = substring.firstIndex(where: { $0 == "}" })
                else { return nil }
            let match = String(prefix)
            substring.remove(at: index)
            return match
        })
    }()
    
    public static let leftBracket: Parser<T> = {
        return Parser<T>(run: { substring -> String? in
            guard
                let prefix = substring.first(where: { $0 == "[" }),
                let index = substring.firstIndex(where: { $0 == "[" })
                else { return nil }
            let match = String(prefix)
            substring.remove(at: index)
            return match
        })
    }()
    
    public static let rightBracket: Parser<T> = {
        return Parser<T>(run: { substring -> String? in
            guard
                let prefix = substring.first(where: { $0 == "]" }),
                let index = substring.firstIndex(where: { $0 == "]" })
                else { return nil }
            let match = String(prefix)
            substring.remove(at: index)
            return match
        })
    }()
    
    public static let leftParenthesis: Parser<T> = {
        return Parser<T>(run: { substring -> String? in
            guard
                let prefix = substring.first(where: { $0 == "(" }),
                let index = substring.firstIndex(where: { $0 == "(" })
                else { return nil }
            let match = String(prefix)
            substring.remove(at: index)
            return match
        })
    }()
    
    public static let rightParenthesis: Parser<T> = {
        return Parser<T>(run: { substring -> String? in
            guard
                let prefix = substring.first(where: { $0 == ")" }),
                let index = substring.firstIndex(where: { $0 == ")" })
                else { return nil }
            let match = String(prefix)
            substring.remove(at: index)
            return match
        })
    }()
}
