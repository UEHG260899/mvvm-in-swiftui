


import Foundation

extension URL {
    
    static func urlForAccounts() -> URL? {
         return URL(string: "https://splashy-functional-linseed.glitch.me/api/accounts")
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string: "https://splashy-functional-linseed.glitch.me/api/accounts")
    }
    
    static func urlForTransfer() -> URL? {
        return URL(string: "https://splashy-functional-linseed.glitch.me/api/transfer")
    }
}
