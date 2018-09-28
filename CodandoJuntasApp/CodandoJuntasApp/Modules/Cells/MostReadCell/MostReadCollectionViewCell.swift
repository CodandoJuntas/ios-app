//
//  MostReadCollectionViewCell.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 24/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class MostReadCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(_ category: Category) {
        self.tagLabel.text = category.title
        self.titleLabel.text = category.subTitle
        
    }
}
