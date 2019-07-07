//
//  Parser.CGSize.swift
//  ParsingKit
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 zkhaider. All rights reserved.
//

import Foundation
import CoreGraphics

extension Parser where T == CGSize {
    
    public static let size: Parser<T> = {
        return zip(.float,
                   .optionalSpaces,
                   .literal(","),
                   .optionalSpaces,
                   .float
            ).map { widthValue, _, _, _, heightValue in
                return CGSize(width: CGFloat(widthValue),
                              height: CGFloat(heightValue))
        }
    }()
    
}
