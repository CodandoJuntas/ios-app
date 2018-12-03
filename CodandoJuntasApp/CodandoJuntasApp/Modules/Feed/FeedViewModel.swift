//
//  MainViewModel.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import RxCocoa

class FeedViewModel {
    
   
    let feed: Observable<[MdFeed]>
    let eventList: Driver<[Event]>
    var mdFeed:[MdFeed] = []
    var events: Events = []
    
    init(feedRepository: FeedRepository, eventsRepository: EventsRepository) {
        
        self.feed = feedRepository.getMdFeed()
        self.eventList = eventsRepository.getEvents().asDriver(onErrorJustReturn: [])
        
    }
}
