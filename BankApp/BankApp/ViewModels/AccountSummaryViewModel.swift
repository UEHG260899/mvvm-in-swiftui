//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import Foundation


class AccountSummaryViewModel: ObservableObject {
    
    @Published var accounts = [AccountViewModel]()
    
    var total: Double {
        accounts.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts() {
        AccountService.shared.getAllAccounts { [weak self] result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self?.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

struct AccountViewModel {
    let account: Account
    
    var id: String {
        account.id.uuidString
    }
    
    var name: String {
        account.name
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double {
        account.balance
    }
}
