//
//  TranferFundsScreen.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import SwiftUI

struct TransferFundsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = TransferFundsViewModel()
    @State var isPresented = false
    @State var isFromAccount = false
        
    var body: some View {
        VStack {
            AccountListView(accounts: viewModel.accounts)
                .frame(height: 300)
            
            TransferFundsAccountSelectionView(viewModel: viewModel, isPresented: $isPresented, isFromAccount: $isFromAccount)
            
            Spacer()
                        
            Button("Submit transfer") {
                viewModel.submitTransfer()
            }
            .padding()
        }
        .onAppear {
            viewModel.populateAccounts()
        }
        .confirmationDialog("Transfer", isPresented: $isPresented) {
            ForEach(viewModel.filteredAccounts, id: \.id) { account in
                Button(account.name) {
                    if self.isFromAccount {
                        self.viewModel.fromAccount = account
                    } else {
                        self.viewModel.toAccount = account
                    }
                }
            }
        } message: {
            Text("Select an account")
        }

    }
}

struct TransferFundsAccountSelectionView: View {
    
    @ObservedObject var viewModel: TransferFundsViewModel
    @Binding var isPresented: Bool
    @Binding var isFromAccount: Bool
    
    var buttonOpacity: CGFloat {
        viewModel.fromAccount != nil ? 1.0 : 0.5
    }
    
    var buttonDisabled: Bool {
        viewModel.fromAccount == nil ? true : false
    }
    
    
    var body: some View {
        VStack(spacing: 10) {
            Button("From \(viewModel.fromAccountType)") {
                isFromAccount = true
                isPresented = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            
            Button("To \(viewModel.toAccountType)") {
                isFromAccount = false
                isPresented = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .opacity(buttonOpacity)
            .disabled(buttonDisabled)
            
            TextField("Ammount", text: $viewModel.ammount)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
        .padding()
    }
}

struct TranferFundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsScreen()
    }
}
