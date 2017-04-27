//
//  KeychainAccess.swift
//  SMI-Influencers
//
//  Created by Kadeem Palacios on 4/26/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation
import KeychainSwift

class KeychainAccess {
    
    
    let keychain = KeychainSwift()

    static let instance = KeychainAccess()
    
    func setToken(value:String, key:String) {
        self.keychain.set(value, forKey: key)
        
    }
    func getToken(key:String) -> String? {
        let token = self.keychain.get(key)
        
        return token
    }
    
    func checkForToken(key:String) -> Bool {
        
        let token = self.keychain.get(key)
        
        if token != nil {
            return false
        } else {
            
            return true
        }
    }
    
    
    
}
