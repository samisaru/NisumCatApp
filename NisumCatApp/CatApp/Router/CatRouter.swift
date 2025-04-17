//
//  CatRouter.swift
//  NisumCatApp
//
//  Created by Sarita Swami on 16/04/25.
//

import Foundation
class CatRouter: CatRouterProtocol {
    static func createModule() -> ViewController {
        let view = ViewController()
        let interactor = CatInteractor()
        let router = CatRouter()
        let presenter = CatPresenter(view: view, interactor: interactor, router: router)
        view.setPresenter(presenter)
        return view
    }
}
