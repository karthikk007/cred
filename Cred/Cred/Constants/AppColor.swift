//
//  AppColor.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

enum AppColor {
    case primary
    case secondary
    
    var color: UIColor {
        switch self {
        case .primary:
            return UIColor(withHex: "#11141b")
        case .secondary:
            return UIColor(withHex: "#a5c1d1")
        }
    }
}

extension AppColor {
    enum ViewController {
        case background
        
        var color: UIColor {
            switch self {
            case .background:
                return AppColor.primary.color
            }
        }
    }
}

extension AppColor {
    enum Text {
        case foreground
        
        var color: UIColor {
            switch self {
            case .foreground:
                return UIColor.white
            }
        }
    }
}

extension AppColor {
    enum CardView {
        case background
        
        var color: UIColor {
            switch self {
            case .background:
                return UIColor(withHex: "#1d222d")
            }
        }
    }
}

extension AppColor {
    enum Shadow {
        case gray
        
        var color: UIColor {
            switch self {
            case .gray:
                return UIColor.gray
            }
        }
    }
}

extension AppColor {
    enum Button {
        case background
        case foreground
        
        var color: UIColor {
            switch self {
            case .background:
                return UIColor(withHex: "#21262e")
            case .foreground:
                return AppColor.secondary.color
            }
        }
    }
}
