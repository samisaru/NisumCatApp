//
//  CatInteractorTests.swift
//  NisumCatAppTests
//
//  Created by Sarita Swami on 17/04/25.
//

import XCTest
@testable import NisumCatApp

class CatInteractorTests: XCTestCase {
    var interactor: CatInteractor!
    var mockSession: MockURLSession!

    override func setUp() {
        super.setUp()
        interactor = CatInteractor()
        mockSession = MockURLSession()
    }

    override func tearDown() {
        interactor = nil
        mockSession = nil
        super.tearDown()
    }

    func testFetchCatData_ReturnsCorrectData() {
        // Arrange
        let factData = """
        {"data":["A group of cats is called a clowder."]}
        """.data(using: .utf8)!
        let imageData = """
        [{
                "id": "14t",
                "url": "https://example.com/cat.jpg",
                "width": 246,
                "height": 233
            }]
        """.data(using: .utf8)!

        mockSession.data = factData
        interactor.fetchCatData { fact, image in
            // Assert
            XCTAssertEqual(fact, "A group of cats is called a clowder.", "The fetched fact should match the mock data.")
            XCTAssertEqual(image, "https://example.com/cat.jpg", "The fetched image URL should match the mock data.")
        }
    }
}
