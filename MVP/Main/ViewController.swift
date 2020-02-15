//
//  ViewController.swift
//  MVP
//
//  Created by Valentino Urbano on 22/01/2020.
//  Copyright © 2020 Valentino Urbano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    init(presenter: PresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    let presenter: PresenterInput
    weak var titleLabel: UILabel?
    weak var nextButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
        setupNextButton()

        presenter.initialLoading()
    }
    
    @objc func goToDetail() {
        presenter.goToDetail()
    }

    private func setupTitleLabel() {
         let label = UILabel(frame: CGRect(x: 0, y: 150, width: 350, height: 55))
         label.textAlignment = .center
         label.textColor = .red
         view.addSubview(label)
         self.titleLabel = label
    }
    private func setupNextButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 450, width: 350, height: 55))
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
        view.addSubview(button)
        self.nextButton = button
    }
}
extension ViewController: PresenterOutput {
    func setupLabel(text: String) {
        titleLabel?.text = text
    }
    
    func showScreen(vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    
}
