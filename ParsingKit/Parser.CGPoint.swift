//
//  Parser.CGPoint.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation

extension Parser where T == CGPoint {
    
    public static let point: Parser<T> = {
        return zip(.float,
                   .optionalSpaces,
                   .literal(","),
                   .optionalSpaces,
                   .float
            ).map { xValue, _, _, _, yValue in
                return CGPoint(x: CGFloat(xValue), y: CGFloat(yValue))
        }
    }()
    
    public static let curlyBracePointParser: Parser<T> = {
        return _curlyBracePointParser
    }()
    
    public static let bracketPointParser: Parser<T> = {
        return _bracketPointParser
    }()
    
    public static let parenthesisPointParser: Parser<T> = {
        return _parenthesisPointParser
    }()
}

/*
 Example: {0, 1}
 */
private let _curlyBracePointParser: Parser<CGPoint> = zip(
    .leftCurlyBrace,
    .optionalSpaces,
    .point,
    .optionalSpaces,
    .rightCurlyBrace
    ).map({ _, _, point, _, _ in
        return point
    })

/*
 Example: [0, 1]
 */
private let _bracketPointParser: Parser<CGPoint> = zip(
    .leftBracket,
    .optionalSpaces,
    .point,
    .optionalSpaces,
    .rightBracket
    ).map({ _, _, point, _, _ in
        return point
    })

/*
 Example: (0, 1)
 */
private let _parenthesisPointParser: Parser<CGPoint> = zip(
    .leftParenthesis,
    .optionalSpaces,
    .point,
    .optionalSpaces,
    .rightParenthesis
    ).map({ _, _, point, _, _ in
        return point
    })
