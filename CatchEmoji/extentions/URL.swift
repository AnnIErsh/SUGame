//
//  URL.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(string: "\(value)")!
    }
}
