//
//  Account.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Savings"
        }
    }
}

struct Account: Codable {
    var id: UUID
    var name: String
    let accountType: AccountType
    var balance: Double
}
