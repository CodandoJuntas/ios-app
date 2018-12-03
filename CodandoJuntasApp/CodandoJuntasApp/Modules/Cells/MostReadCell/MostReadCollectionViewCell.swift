//
//  MostReadCollectionViewCell.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 24/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class MostReadCollectionViewCell: UICollectionViewCell {
    
    private enum regexTags: String {
        
        case address = "##[^#]+"
        case data = "###[^#]+"
        case price = "####[^#]+"
        case link = "#####[^#]+"
        case description = "######[^#]+"
        case content = "(?<=\\*).+?(?=$|\\r\\n)"
    }

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ event: Event) {
        let parsedEvent = parseEventBody(event.body)
        self.tagLabel.text = event.labels.last?.name
        self.titleLabel.text = event.title
    }
    
    func parseEventBody( _ eventBody: String) -> EventBody {
        
        let event = EventBody()
        
        let addressBlock = eventBody.match(for: regexTags.address.rawValue) ?? ""
        event.address = addressBlock.match(for: regexTags.content.rawValue) ?? ""
       
        let dataBlock = eventBody.match(for: regexTags.data.rawValue) ?? ""
        event.date = dataBlock.match(for: regexTags.content.rawValue) ?? ""
        
        let priceBlock = eventBody.match(for: regexTags.price.rawValue)
        event.price = priceBlock?.match(for: regexTags.content.rawValue) ?? ""
        
        let linkBlock = eventBody.match(for: regexTags.link.rawValue)
        event.link = linkBlock?.match(for: regexTags.content.rawValue) ?? ""
        
        let descriptionBlock = eventBody.match(for: regexTags.description.rawValue)
        event.description = descriptionBlock?.match(for: regexTags.content.rawValue) ?? ""
        
        return event
    }
    
  
    
}
