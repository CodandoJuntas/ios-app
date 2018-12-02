//
//  EventsServiceImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 22/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class EventsServiceImpl: EventsService {

    let provider: MoyaProvider<EventsRouter>
    
    init(provider: MoyaProvider<EventsRouter>) {
        self.provider = provider
    }
    
    func getEvents() -> Single<Response> {
        return self.provider.rx.request(.events)
    }

}
