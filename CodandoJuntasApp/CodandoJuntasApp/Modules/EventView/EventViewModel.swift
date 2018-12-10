//
//  EventViewViewModel.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 10/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import RxCocoa

class EventViewModel {
    
    //let input: Driver<Void>
    
    init(
        ) {
        
    }
    
    func parseEventBody( _ eventBody: String) -> EventBody {
        
        let event = EventBody()
        
        let addressBlock = eventBody.match(for: eventRegexTags.address.rawValue) ?? ""
        event.address = addressBlock.match(for: eventRegexTags.content.rawValue) ?? ""
        
        let dataBlock = eventBody.match(for: eventRegexTags.data.rawValue) ?? ""
        event.date = dataBlock.match(for: eventRegexTags.content.rawValue) ?? ""
        
        let priceBlock = eventBody.match(for: eventRegexTags.price.rawValue)
        event.price = priceBlock?.match(for: eventRegexTags.content.rawValue) ?? ""
        
        let linkBlock = eventBody.match(for: eventRegexTags.link.rawValue)
        event.link = linkBlock?.match(for: eventRegexTags.content.rawValue) ?? ""
        
        let descriptionBlock = eventBody.match(for: eventRegexTags.description.rawValue)
        event.description = descriptionBlock?.match(for: eventRegexTags.content.rawValue) ?? ""
        
        return event
    }
    
}
