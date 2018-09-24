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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        return UITableViewCell()
    }
    
    
    
    
}
