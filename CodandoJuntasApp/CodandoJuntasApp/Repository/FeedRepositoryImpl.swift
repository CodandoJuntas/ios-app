//
//  FeedRepositoryImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class FeedRepositoryImpl: FeedRepository {
    
    let service: FeedService
    
    init(service: FeedService) {
        self.service = service
    }
    
    
}
