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
    var onRequestLink: (String) -> () = {target in}

    init(feedRepository: FeedRepository, eventsRepository: EventsRepository) {
        
        self.feed = feedRepository.getMdFeed()
        self.eventList = eventsRepository.getEvents().asDriver(onErrorJustReturn: [])
        
    }
    
     func verifyAction(_ indexPath: IndexPath) {
        let link = mdFeed[indexPath.section - 2].items[indexPath.row].link
        print("link ->>> \(link)")
        onRequestLink(link)
    }
}
