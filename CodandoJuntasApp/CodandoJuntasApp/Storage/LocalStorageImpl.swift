//
//  LocalStorageImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//


import Foundation
import RxSwift

struct LocalStorageKeys {
    private init() {}
    
    static let lastSearch = "last_search"
    static let firstAccess = "first_access"
    
}

class LocalStorageImpl: LocalStorage {
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        userDefaults.register(defaults: [LocalStorageKeys.firstAccess: true])
    }
    
    var lastSearch: Observable<[String]> {
        return userDefaults.rx
            .observe([String].self, LocalStorageKeys.lastSearch)
            .distinctUntilChanged()
            .unwrap()
    }
    
    var firstAccess: Bool {
        get {
            return userDefaults.bool(forKey: LocalStorageKeys.firstAccess)
        } set {
            userDefaults.set(newValue, forKey: LocalStorageKeys.firstAccess)
        }
    }
    
    func clear() {
        userDefaults.removeObject(forKey: LocalStorageKeys.lastSearch)
        userDefaults.removeObject(forKey: LocalStorageKeys.firstAccess)
    }
    
    
}
