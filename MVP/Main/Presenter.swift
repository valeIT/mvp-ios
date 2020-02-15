//
//  Presenter.swift
//  MVP
//
//  Created by Valentino Urbano on 22/01/2020.
//  Copyright © 2020 Valentino Urbano. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterInput: class {
    var userInterface: PresenterOutput? { get set }
    func initialLoading()
    func goToDetail()
}

protocol PresenterOutput: class {
    func setupLabel(text: String)
    func showScreen(vc: UIViewController)
}

class Presenter: PresenterInput {
    
    weak var userInterface: PresenterOutput?

    func initialLoading() {
        userInterface?.setupLabel(text: "Home")
    }
    
    func goToDetail() {
        //TODO: Should use Router/Coordinator instead
        let presenter = DetailPresenter(dismissalAction: { [weak self] in
            self?.userInterface?.setupLabel(text: "Dismissed")
        })
        let detail = DetailViewController(presenter: presenter)
        presenter.userInterface = detail
        
        userInterface?.showScreen(vc: detail)
    }
    
}
