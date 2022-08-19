//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @StateObject private var viewModel = AccountSummaryViewModel()
    
    var body: some View {
        NavigationView {            
            GeometryReader { proxy in
                VStack {
                    AccountListView(accounts: self.viewModel.accounts)
                        .frame(height: proxy.size.height / 2)
                    
                    Text("\(self.viewModel.total.formatAsCurrency())")
                    
                    Spacer()
                }
                .onAppear {
                    self.viewModel.getAllAccounts()
                }
                .navigationTitle("Account Summary")
            }
        }
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
