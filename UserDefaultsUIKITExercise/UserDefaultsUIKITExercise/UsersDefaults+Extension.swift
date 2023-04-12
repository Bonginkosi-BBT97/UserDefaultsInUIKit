//
//  UsersDefaultsKeys.swift
//  UserDefaultsUIKITExercise
//
//  Created by Bonginkosi Tshabalala on 2023/04/12.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultskeys: String {
        case switchIsOn
        case signedInUser
    }
    
    var switchIsOn: Bool {
        get {
            bool(forKey: UserDefaultskeys.switchIsOn.rawValue)
        } set {
            
            setValue(newValue , forKey: UserDefaultskeys.switchIsOn.rawValue)
            
        }
    }
    
    var signedInUser: User? {
        get {
            if let data =  object(forKey: UserDefaultskeys.signedInUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
        }
        set {
            
            if newValue == nil {
                removeObject(forKey: UserDefaultskeys.signedInUser.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultskeys.signedInUser.rawValue)
            }
            
        }
    }
}
