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
    return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return viewModel.projectsFeed.count
        }
    }

     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        switch section {
        case 1:
            return "Introdução"
        case 2:
            return "Fundamentos de Programação"
        default:
            return nil
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
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.feedTableViewCell, for: indexPath) as! FeedTableViewCell
            cell.setupCell( self.viewModel.projectsFeed[indexPath.row])
            return cell
        }
        
    }
    
    
    
    
}
