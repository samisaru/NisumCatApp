//
//  MockURLSession.swift
//  NisumCatAppTests
//
//  Created by Sarita Swami on 17/04/25.
//

import XCTest

class MockURLSession: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    override func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        let mockDataTask = MockURLSessionDataTask {
            completionHandler(self.data, self.response, self.error)
        }
        return mockDataTask
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
