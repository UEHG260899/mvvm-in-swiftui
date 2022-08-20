//
//  AddAccountViewModel.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import Foundation

class AddAccountViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    
    @Published var name = ""
    @Published var accountType: AccountType = .checking
    @Published var balance = ""
    
    
    
}

extension AddAccountViewModel {
    private var isNameValid: Bool {
        !name.isEmpty
    }
    
    private var isBalanceValid: Bool {
        guard let userBalance = Double(balance) else {
            return false
        }
        
        return userBalance <= 0 ? false : true
    }
    
    private func isValid() -> Bool {
        var errors = [String]()
        
        if !isNameValid {
            errors.append("Name is not valid")
        }
        if !isBalanceValid {
            errors.append("Balance is not valid")
        }
        if !errors.isEmpty {
            self.errorMessage = errors.joined(separator: "\n")
            
            return false
        }
        
        return true
    }
}

extension AddAccountViewModel {
    func createAccount(completion: @escaping (Bool) -> Void) {
        
        if !isValid() {
            completion(false)
            return
        }
        
        let createAccountRequest = CreateAccountRequest(name: name,
                                                        accountType: accountType.rawValue,
                                                        balance: Double(balance)!)
        
        AccountService.shared.createAccount(account: createAccountRequest) { [weak self] result in
            switch result {
            case .success(let response):
                if response.success {
                    completion(true)
                } else {
                    if let error = response.error {
                        DispatchQueue.main.async {
                            self?.errorMessage = error
                            completion(false)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
