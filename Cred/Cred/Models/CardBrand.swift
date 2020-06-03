//
//  CardBrand.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

enum CardBrand: String {
    case amex
    case sbi
    case hdfc
    
    var name: String {
        switch self {
        case .amex:
            return "AMEX"
        case .sbi:
            return "SBI"
        case .hdfc:
            return "HDFC"
        }
    }
    
    var logo: UIImage? {
        switch self {
        case .amex:
            return UIImage(named: "amex")
        case .sbi:
            return UIImage(named: "sbi")?.withRenderingMode(.alwaysTemplate)
        case .hdfc:
            return UIImage(named: "hdfc")
        }
    }
    
    var color: UIColor {
        switch self {
        case .amex:
            return UIColor(withHex: "#4a796d")
        case .sbi:
            return UIColor(withHex: "#4626a6")
        case .hdfc:
            return UIColor(withHex: "#292c33")
        }
    }
}
