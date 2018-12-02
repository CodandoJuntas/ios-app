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
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ item: Item){
        
        titleLabel.text = item.title
        subtitleLabel.text = item.description
        
    }
    
}
