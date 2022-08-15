//
//  Date.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 15.08.2022.
//

import Foundation

extension Date: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        self = formatter.date(from: value)!
    }
    
    static func makeCurretnDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: Date.now)
    }
}
