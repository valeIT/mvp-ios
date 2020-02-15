//
//  DetailRepository.swift
//  MVP
//
//  Created by Valentino Urbano on 22/01/2020.
//  Copyright © 2020 Valentino Urbano. All rights reserved.
//

import Foundation

final class DetailRepository {
    var model: DetailModel?
    
    typealias Completion = (DetailModel) -> Void
    
    func loadData(completion: Completion) {
        //TODO: Get model from network / db
        let model = DetailModel(name: "Detail")
        self.model = model
        completion(model)
    }
}
