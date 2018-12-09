//
//  FeedTableViewDataSource.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 23/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class FeedTableViewDataSource: NSObject, UITableViewDataSource {
    
    let viewModel: FeedViewModel!
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.mdFeed.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mdFeed[section].items.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
             let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.feedTableViewCell, for: indexPath) as! FeedTableViewCell
            cell.setupCell(viewModel.mdFeed[indexPath.section].items[indexPath.row])
            
            return cell
        
    }
    
    
}
