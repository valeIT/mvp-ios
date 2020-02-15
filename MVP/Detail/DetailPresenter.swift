//
//  DetailPresenter.swift
//  MVP
//
//  Created by Valentino Urbano on 22/01/2020.
//  Copyright © 2020 Valentino Urbano. All rights reserved.
//

import Foundation

protocol DetailPresenterInput: class {
    var userInterface: DetailPresenterOutput? { get set }
    
    func backAction()
    func initialLoading()
}

protocol DetailPresenterOutput: class {
    func showDetail(withText: String)
    func dismiss()
}

class DetailPresenter: DetailPresenterInput {
    
    init(dismissalAction: @escaping Dismissal) {
        self.dismissalAction = dismissalAction
    }
    
    weak var userInterface: DetailPresenterOutput?
    private let dismissalAction: Dismissal
    private let repository = DetailRepository()
    
    func initialLoading() {
        repository.loadData { [weak self] (data) in
            self?.userInterface?.showDetail(withText: data.name)
        }
    }
    
    func backAction() {
        dismissalAction()
        userInterface?.dismiss()
    }
}
