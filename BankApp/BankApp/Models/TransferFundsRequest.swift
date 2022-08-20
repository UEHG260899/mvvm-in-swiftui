//
//  TransferFunds.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

struct TransferFundsRequest: Encodable {
    let accountFromId: String
    let accountToId: String
    let amount: Double
}
