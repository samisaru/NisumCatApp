//
//  CatPresenter.swift
//  NisumCatApp
//
//  Created by Sarita Swami on 16/04/25.
//

import Foundation
class CatPresenter: CatPresenterProtocol {
    private weak var view: CatViewProtocol?
    private let interactor: CatInteractorProtocol
    private let router: CatRouterProtocol
    
    init(view: CatViewProtocol, interactor: CatInteractorProtocol, router: CatRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchData() {
        loadCatData()
    }
    
    func handleTap() {
        loadCatData()
    }
    
    private func loadCatData() {
        interactor.fetchCatData { [weak self] fact, image in
            self?.view?.updateView(with: fact, imageURL: image)
        }
    }
}
