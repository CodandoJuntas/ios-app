//
//  MostReadTableViewCell.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 23/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class MostReadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: FeedViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(R.nib.mostReadCollectionViewCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MostReadTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoriesFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.mostReadCollectionViewCell, for: indexPath) as! MostReadCollectionViewCell
        cell.setupCell(viewModel.categoriesFeed[indexPath.row])
        return cell
    }
    
    
    
}
