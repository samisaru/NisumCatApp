//
//  CatPresenterTests.swift
//  NisumCatAppTests
//
//  Created by Sarita Swami on 17/04/25.
//

import XCTest
@testable import NisumCatApp

class CatPresenterTests: XCTestCase {
    var presenter: CatPresenter!
    var mockView: MockCatView!
    var mockInteractor: MockCatInteractor!
    var mockRouter: MockCatRouter!

    override func setUp() {
        super.setUp()
        mockView = MockCatView()
        mockInteractor = MockCatInteractor()
        mockRouter = MockCatRouter()
        presenter = CatPresenter(view: mockView, interactor: mockInteractor, router: mockRouter)
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func testFetchData_TriggersDataFetchAndUpdatesView() {
        // Act
        presenter.fetchData()

        // Assert
        XCTAssertTrue(mockInteractor.fetchCatDataCalled, "The interactor's fetchCatData method should be called.")
        XCTAssertTrue(mockView.updateViewCalled, "The view's updateView method should be called.")
        XCTAssertEqual(mockView.fact, "A group of cats is called a clowder.", "The fact should be correctly passed to the view.")
        XCTAssertEqual(mockView.imageURL, "https://example.com/cat.jpg", "The image URL should be correctly passed to the view.")
    }

    func testHandleTap_TriggersDataFetchAndUpdatesView() {
        // Act
        presenter.handleTap()

        // Assert
        XCTAssertTrue(mockInteractor.fetchCatDataCalled, "The interactor's fetchCatData method should be called.")
        XCTAssertTrue(mockView.updateViewCalled, "The view's updateView method should be called.")
        XCTAssertEqual(mockView.fact, "A group of cats is called a clowder.", "The fact should be correctly passed to the view.")
        XCTAssertEqual(mockView.imageURL, "https://example.com/cat.jpg", "The image URL should be correctly passed to the view.")
    }
}
