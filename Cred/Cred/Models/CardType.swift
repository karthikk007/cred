//
//  CardType.swift
//  Cred
//
//  Created by Kumar, Karthik on 26/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import UIKit

enum CardType: String {
    case visa
    case masterCard
    
    var logo: UIImage? {
        switch self {
        case .visa:
            return UIImage(named: "visa")
        case .masterCard:
            return UIImage(named: "mastercard")
        }
    }
}
