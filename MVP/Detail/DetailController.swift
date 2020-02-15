//
//  DetailController.swift
//  MVP
//
//  Created by Valentino Urbano on 22/01/2020.
//  Copyright © 2020 Valentino Urbano. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    init(presenter: DetailPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    let presenter: DetailPresenterInput
    weak var titleLabel: UILabel?
    weak var backButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
        setupBackButton()
        
        presenter.initialLoading()
    }
    
    @objc func goBack() {
        presenter.backAction()
    }
    
    
    private func setupTitleLabel() {
         let label = UILabel(frame: CGRect(x: 0, y: 150, width: 350, height: 55))
         label.textAlignment = .center
         label.textColor = .red
         view.addSubview(label)
         self.titleLabel = label
    }
    private func setupBackButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 450, width: 350, height: 55))
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(button)
        self.backButton = button
    }
}

extension DetailViewController: DetailPresenterOutput {
    func showDetail(withText text: String) {
        titleLabel?.text = text
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
