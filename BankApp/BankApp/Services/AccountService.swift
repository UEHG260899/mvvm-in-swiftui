//
//  AccountService.swift
//  BankApp
//
//  Created by Uriel Hernandez Gonzalez on 18/08/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class AccountService {
    
    static let shared = AccountService()
    
    private init() {}
    
    
    func getAllAccounts(completion: @escaping (Result<[Account]?, NetworkError>) -> Void) {
        
        guard let url = URL.urlForAccounts() else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
                  error == nil else {
                completion(.failure(.noData))
                return
            }

            do {
                let accountData = try JSONDecoder().decode([Account].self, from: data)
                completion(.success(accountData))
            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
            
            
        }.resume()
        
    }
    
    func createAccount(account: CreateAccountRequest, completion: @escaping (Result<CreateAccountResponse, NetworkError>) -> Void) {
        
        guard let url = URL.urlForCreateAccounts() else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(account)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data,
                  error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(CreateAccountResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func transferFunds(transferFundRequest: TransferFundsRequest, completion: @escaping (Result<TransferFundResponse, NetworkError>) -> Void) {
        
        guard let url = URL.urlForTransfer() else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(transferFundRequest)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data,
                  error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(TransferFundResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
