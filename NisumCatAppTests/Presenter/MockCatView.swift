//
//  MockCatView.swift
//  NisumCatAppTests
//
//  Created by Sarita Swami on 17/04/25.
//

import XCTest
@testable import NisumCatApp

class MockCatView: CatViewProtocol {
    var updateViewCalled = false
    var fact: String?
    var imageURL: String?

    func updateView(with fact: String, imageURL: String) {
        updateViewCalled = true
        self.fact = fact
        self.imageURL = imageURL
    }
}
class MockCatInteractor: CatInteractorProtocol {
    var fetchCatDataCalled = false

    func fetchCatData(completion: @escaping (String, String) -> Void) {
        fetchCatDataCalled = true
        let mockFact = CatFact(data: ["A group of cats is called a clowder."])
        let mockImage = CatImage(id: "1", url: "https://example.com/cat.jpg",width: 200, height: 200)
        if let fact = mockFact.data?.first as? String, let imageURL = mockImage.url as? String {
            completion(fact, imageURL)
        }
        
    }
}
class MockCatRouter: CatRouterProtocol {
    static func createModule() -> NisumCatApp.ViewController {
        return ViewController()
    }
}
