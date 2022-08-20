//
//  AddAccountScreen.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 20/08/22.
//

import SwiftUI

struct AddAccountScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = AddAccountViewModel()
    
    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)
            Picker(selection: self.$viewModel.accountType, label: EmptyView()) {
                ForEach(AccountType.allCases, id: \.self) { accountType in
                    Text(accountType.title)
                        .tag(accountType)
                }
            }.pickerStyle(.segmented)
            
            TextField("Balance", text: $viewModel.balance)
            
            HStack {
                Spacer()
                Button("Submit") {
                    viewModel.createAccount { success in
                        if success {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
            }
        }
    }
}

struct AddAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountScreen()
    }
}
