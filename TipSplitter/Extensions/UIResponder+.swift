//
//  UIResponder+.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 21/06/24.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
