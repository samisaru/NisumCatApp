//
//  CatInfo.swift
//  NisumCatApp
//
//  Created by Sarita Swami on 16/04/25.
//

import Foundation
struct CatFact: Codable {
    let data: [String]?
}

struct CatImage: Codable {
    let id: String?
    let url: String?
    let width, height: Int?
}
