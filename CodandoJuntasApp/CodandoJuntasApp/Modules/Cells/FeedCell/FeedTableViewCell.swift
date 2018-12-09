//
//  FeedTableViewCell.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 23/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderColor = UIColor(hexString: "#404142")
        
        cardView.layer.borderWidth = 1.0
        cardView.layer.cornerRadius = 4
        cardView.layer.borderColor = borderColor.cgColor
        cardView.addShadow(offSetX: 0, offSetY: 2, radius: 4, opacity: 0.5)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

        // Configure the view for the selected state
    }
    
    func setupCell(_ item: Item){
        
        titleLabel.text = item.title
        subtitleLabel.text = item.description
        
    }
    
}
