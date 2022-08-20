//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

struct CreateAccountRequest: Codable {
    let name: String
    let accountType: String
    let balance: Double
}
