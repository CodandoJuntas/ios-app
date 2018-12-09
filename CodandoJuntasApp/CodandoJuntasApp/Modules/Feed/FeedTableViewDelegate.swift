//
//  FeedTableViewDelegate.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 23/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

class FeedTableViewDelegate: NSObject, UITableViewDelegate {
    
    let viewModel: FeedViewModel!
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderSectionView") as? HeaderSectionView else {
            return nil
        }

        switch section {
        case 0:
            header.setTitle("Destaques")
            
        case 1:
            header.setTitle("Eventos")
            
        default:
            header.configHeader(section: viewModel.mdFeed[section-2])
        }

        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.verifyAction(indexPath)
    }
    
    

}
