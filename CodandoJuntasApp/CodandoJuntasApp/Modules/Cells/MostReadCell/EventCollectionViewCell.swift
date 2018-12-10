//
//  MostReadCollectionViewCell.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 24/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    private enum eventRegexTags: String {
        
        case address = "##[^#]+"
        case data = "###[^#]+"
        case price = "####[^#]+"
        case link = "#####[^#]+"
        case description = "######[^#]+"
        case content = "(?<=\\*).+?(?=$|\\r\\n)"
        case eventName = "(?<=\\-> ).+?(?=$)"
        case eventDate = "(?<=\\[ ).+?(?=\\])"
        case eventHour = "(?<=\\- ).+?(?=$)"
    }

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderColor = UIColor(hexString: "#404142")
        
        cardView.layer.borderWidth = 1.0
        cardView.layer.cornerRadius = 4
        cardView.layer.borderColor = borderColor.cgColor
        cardView.addShadow(offSetX: 0, offSetY: 2, radius: 4, opacity: 0.5)
        
    }
    
    func setupCell(_ event: Event) {
        let parsedEvent = parseEventBody(event.body)
        self.tagLabel.text = event.labels.last?.name ?? "iOS"
        self.titleLabel.text = event.title.match(for: eventRegexTags.eventName.rawValue) ?? ""
        self.dateLabel.text = parsedEvent.date.match(for: eventRegexTags.eventDate.rawValue) ?? ""
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
