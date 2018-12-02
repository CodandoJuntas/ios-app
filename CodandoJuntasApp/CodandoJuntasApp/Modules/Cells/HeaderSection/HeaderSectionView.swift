//
//  HeaderSectionView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 06/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
         descriptionLabel.isHidden = false
    }
    
    func configHeader(section: MdFeed){
        
        self.titleLabel.text = section.title
        
        if section.description != ""{
            self.descriptionLabel.text = section.description
        }
        
        descriptionLabel.isHidden = section.description == ""
    }
    
    func setTitle(_ title: String, description: String = "") {
        self.titleLabel.text = title
        
        if description != ""{
            self.descriptionLabel.text = description
        }
         descriptionLabel.isHidden = description == ""
    }

}
