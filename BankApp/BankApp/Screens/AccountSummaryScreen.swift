//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {
    
    @StateObject private var viewModel = AccountSummaryViewModel()
    @State private var activeSheet: ActiveSheet = .addAccount
    @State private var isPresented = false
        
    var body: some View {
        NavigationView {            
            GeometryReader { proxy in
                VStack {
                    AccountListView(accounts: self.viewModel.accounts)
                        .frame(height: proxy.size.height / 2)
                    
                    Text("\(self.viewModel.total.formatAsCurrency())")
                    
                    Spacer()
                    
                    Button("Tranfer Funds") {
                        activeSheet = .transferFunds
                        isPresented = true
                    }.padding()
                }
                .onAppear {
                    self.viewModel.getAllAccounts()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add account") {
                            activeSheet = .addAccount
                            isPresented = true
                        }
                    }
                }
                .sheet(isPresented: $isPresented, onDismiss: viewModel.getAllAccounts) {
                    
                    if activeSheet == .transferFunds {
                        TransferFundsScreen()
                    } else if activeSheet == .addAccount {
                        AddAccountScreen()
                    }
                    
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
