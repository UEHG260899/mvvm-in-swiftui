//
//  TranferFundsViewModel.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

class TransferFundsViewModel: ObservableObject {

    @Published var accounts = [AccountViewModel]()
    @Published var ammount = ""
        
    var isAmmountValid: Bool {
        guard let userAmmount = Double(ammount) else {
            return false
        }
        
        return userAmmount <= 0 ? false : true
    }
    
    var filteredAccounts: [AccountViewModel] {
        if fromAccount == nil {
            return accounts
        } else {
            return accounts.filter { $0.id !=  fromAccount!.id}
        }
    }
    
    var fromAccount: AccountViewModel?
    var toAccount: AccountViewModel?
    
    var fromAccountType: String {
        fromAccount != nil ? fromAccount!.accountType : ""
    }
    
    var toAccountType: String {
        toAccount != nil ? toAccount!.accountType : ""
    }

    func populateAccounts() {
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
    
    func submitTransfer() {
        guard let fromAccount = fromAccount,
              let toAccount = toAccount,
              let ammount = Double(ammount) else {
            return
        }
        
        let transfer = TransferFundsRequest(accountFromId: fromAccount.id.lowercased(), accountToId: toAccount.id.lowercased(), amount: ammount)
        
        AccountService.shared.transferFunds(transferFundRequest: transfer) { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
