//
//  EventsRepositoryImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 27/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import Moya
import Firebase
import RxSwift

class EventsRepositoryImpl: EventsRepository {

    let service: EventsService
    
    init(service: EventsService) {
        self.service = service
    }
    
    func getEvents() -> Single<Events> {
        return self.service.getEvents().map(Events.self)
    }
}
