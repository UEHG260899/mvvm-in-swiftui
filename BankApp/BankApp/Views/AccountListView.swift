//
//  AccountListView.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import SwiftUI

struct AccountListView: View {
    
    let accounts: [AccountViewModel]
    
    var body: some View {
        List(accounts, id: \.id) { account in
            AccountCell(account: account)
        }
        .listStyle(.plain)
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let account = Account(id: UUID(), name: "Uriel", accountType: .checking, balance: 1000)
        
        let accountViewModel = AccountViewModel(account: account)
        
        AccountListView(accounts: [accountViewModel])
    }
}

struct AccountCell: View {
    
    let account: AccountViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(account.name)
                    .font(.headline)
                
                Text(account.accountType)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(.green)
        }
    }
}
