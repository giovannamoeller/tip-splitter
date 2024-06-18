//
//  Tip.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fifteenPercent
    case twentyPercent
    case custom
    
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
        case .custom:
            return "Custom tip"
        }
    }
}
