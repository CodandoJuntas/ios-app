//
//  CloudTagView + rx.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 20/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: CloudTagView {
    
    var items: Binder<[String]> {
        return Binder(self.base) { tagView, items in
            tagView.items = items
        }
    }
    
    var tagSelected: Driver<String> {
        return base.collectionView.rx.modelSelected(String.self)
            .asDriver(onErrorJustReturn: "")
    }
    
}
