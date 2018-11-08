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
        return viewModel.mdFeed.count + 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return viewModel.mdFeed[section-2].items.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.highlightedTableViewCell, for: indexPath) as! HighlightedTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.mostReadTableViewCell, for: indexPath) as! MostReadTableViewCell
                cell.viewModel = self.viewModel
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
