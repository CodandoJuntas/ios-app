//
//  LocalStorage.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol LocalStorage: class {
    
    var lastSearch: Observable<[String]> { get }
    var firstAccess: Bool { get set }
    func clear()
}
