//
//  ThemeFont.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

struct ThemeFont {
    static var bodyRegular: UIFont {
        return .systemFont(ofSize: 16.0)
    }
    
    static var bodyBold: UIFont {
        return .systemFont(ofSize: 16.0, weight: .bold)
    }
    
    static var titleRegular: UIFont {
        return .systemFont(ofSize: 22.0)
    }
    
    static var titleBold: UIFont {
        return .systemFont(ofSize: 22.0, weight: .bold)
    }
    
    static var largeTitleBold: UIFont {
        return .systemFont(ofSize: 44.0, weight: .bold)
    }
}
