//
//  CatProtocols.swift
//  NisumCatApp
//
//  Created by Sarita Swami on 16/04/25.
//

import Foundation
protocol CatInteractorProtocol {
    func fetchCatData(completion: @escaping (String, String) -> Void)
}

protocol CatInteractorOutputProtocol: AnyObject {
    func didFetchCatFact(_ fact: String)
    func didFetchCatImage(_ imageUrl: String)
}
protocol CatPresenterProtocol {
    func fetchData()
    func handleTap()
}
protocol CatViewProtocol: AnyObject {
    func updateView(with fact: String, imageURL: String)
}
protocol CatRouterProtocol: AnyObject {
    static func createModule() -> ViewController
}
