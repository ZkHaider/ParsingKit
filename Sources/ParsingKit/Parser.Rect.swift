//
//  Parser.Rect.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
#if canImport(CoreGraphics)
import CoreGraphics

extension Parser where T == CGRect {
    
    public static let rectParser: Parser<T> = {
        return zip(
            .point,
            .size
            ).map { origin, size in
                return CGRect(origin: origin,
                              size: size)
        }
    }()
    
    public static let curlyBraceRectParser: Parser<T> = {
        return zip(.leftCurlyBrace,
                   .optionalSpaces,
                   .curlyBracePointParser,
                   .optionalSpaces,
                   .literal(","),
                   .optionalSpaces,
                   .curlyBracePointParser,
                   .optionalSpaces,
                   .rightCurlyBrace
            ).map { _, _, origin, _, _, _, size, _, _ in
                return CGRect(x: CGFloat(origin.x), y: CGFloat(origin.y),
                              width: CGFloat(size.x), height: CGFloat(size.y))
        }
    }()
    
}
#endif 
