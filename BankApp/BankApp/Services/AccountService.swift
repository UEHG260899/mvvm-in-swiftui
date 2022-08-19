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
            
//            guard let accountData = try? JSONDecoder().decode([Account].self, from: data) else {
//                completion(.failure(.decodingError))
//                return
//            }
            
            do {
                let accountData = try JSONDecoder().decode([Account].self, from: data)
                completion(.success(accountData))
            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
            
            
        }.resume()
        
    }
}
