//
//  ViewController.swift
//  NisumCatApp
//
//  Created by Sarita Swami on 16/04/25.
//

import UIKit

class ViewController: UIViewController, CatViewProtocol {
    private var presenter: CatPresenterProtocol!
    private let factLabel = UILabel()
    private let catImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.fetchData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        factLabel.numberOfLines = 0
        factLabel.textAlignment = .center
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.contentMode = .scaleAspectFill
        catImageView.clipsToBounds = true
        
        view.addSubview(factLabel)
        view.addSubview(catImageView)
        
        NSLayoutConstraint.activate([
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            catImageView.heightAnchor.constraint(equalToConstant: 300),
            catImageView.widthAnchor.constraint(equalToConstant: 300),
            
            factLabel.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        presenter.handleTap()
    }
    
    func updateView(with fact: String, imageURL: String) {
        if let url = URL(string: imageURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.factLabel.text = fact
                        self.catImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    func setPresenter(_ presenter: CatPresenterProtocol) {
        self.presenter = presenter
    }
}
