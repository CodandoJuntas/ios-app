//
//  HeaderSectionView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 06/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {

    
    static let reuseIdentifer = "HeaderSectionView"
    
    lazy var titleLabel:UILabel = {
       let label = UILabel()
        label.text = "TITULO"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição"
        return label
    }()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        titleLabel.prepareForConstraints()
        descriptionLabel.prepareForConstraints()
        
        titleLabel.pinLeft(12.0)
        titleLabel.pinRight(12.0)
        titleLabel.pinTop(6.0)
       
        descriptionLabel.pinLeft(12.0)
        descriptionLabel.pinRight(12.0)
        descriptionLabel.pinTop(3.0, target: titleLabel)
        descriptionLabel.pinBottom()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
