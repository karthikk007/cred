//
//  CardTableViewModel.swift
//  Cred
//
//  Created by Kumar, Karthik on 27/05/20.
//  Copyright © 2020 Kumar, Karthik. All rights reserved.
//

import Foundation

struct CardListModel {
    var cards: [CardDetails] = [
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .amex, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .sbi, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .hdfc, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .amex, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .sbi, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .hdfc, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .amex, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .sbi, type: .visa, number: "1234-1234-1234-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "kar", lastName: "kar",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .hdfc, type: .visa, number: "1234-1234-1234-1234")),
    ]
}
