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
    var mdFeed:[MdFeed] = []
    var onRequestLink: (String) -> () = {target in}

    init(feedRepository: FeedRepository) {
        
        self.feed = feedRepository.getMdFeed()

    }
    
     func verifyAction(_ indexPath: IndexPath) {
        let link = mdFeed[indexPath.section].items[indexPath.row].link
        print("link ->>> \(link)")
        onRequestLink(link)
    }
}
