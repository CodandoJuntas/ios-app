//
//  FeedHeaderViewModel.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 09/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import RxCocoa

class FeedHeaderViewModel {
    
    let eventList: Driver<[Event]>
    var events: Events = []

    init(
        eventsRepository: EventsRepository) {
       
        self.eventList = eventsRepository.getEvents().asDriver(onErrorJustReturn: [])
    }
}
