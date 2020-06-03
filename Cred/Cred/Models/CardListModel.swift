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
        CardDetails(customerInfo: CustomerInfo(firstName: "Tom", lastName: "Cruise",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .amex, type: .visa, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Vin", lastName: "Diesel",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .sbi, type: .masterCard, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Christian", lastName: "Bale",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .hdfc, type: .visa, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Leonardo", lastName: "DiCaprio",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .amex, type: .masterCard, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Paul", lastName: "Walker",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .sbi, type: .visa, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Daniel", lastName: "Craig",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .hdfc, type: .masterCard, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Sunny", lastName: "Leone",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .amex, type: .visa, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Angelina", lastName: "Jolie",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .sbi, type: .masterCard, number: "1234-XXXX-XXXX-1234")),
        CardDetails(customerInfo: CustomerInfo(firstName: "Emma", lastName: "Watson",
                                               dob: Date()),
                    cardInfo: CardInfo(brand: .hdfc, type: .visa, number: "1234-XXXX-XXXX-1234")),
    ]
}
