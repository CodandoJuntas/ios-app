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
    @IBOutlet weak var tagLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ project: Project){
        
        titleLabel.text = project.title
        subtitleLabel.text = project.subTitle
        tagLabel.text = project.tags?.first ?? ""
        
    }
    
}
