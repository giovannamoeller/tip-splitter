//
//  Tip.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import Foundation

public enum Tip: Equatable {
    case none
    case tenPercent
    case fifteenPercent
    case twentyPercent
    case custom(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            return ""
        case .tenPercent:
            return "10%"
        case .fifteenPercent:
            return "15%"
        case .twentyPercent:
            return "20%"
        case .custom(_):
            return "Custom tip"
        }
    }
}
