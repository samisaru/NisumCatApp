//
//  CatInteractor.swift
//  NisumCatApp
//
//  Created by Sarita Swami on 16/04/25.
//

import Foundation
class CatInteractor: CatInteractorProtocol {
    func fetchCatData(completion: @escaping (String, String) -> Void) {
        let factURL = URL(string: "https://meowfacts.herokuapp.com/")!
        let imageURL = URL(string: "https://api.thecatapi.com/v1/images/search")!
        
        let group = DispatchGroup()
        var catFact: CatFact?
        var catImage: CatImage?
        
        group.enter()
        URLSession.shared.dataTask(with: factURL) { data, _, _ in
            if let data = data {
                catFact = try? JSONDecoder().decode(CatFact.self, from: data)
            }
            group.leave()
        }.resume()
        
        group.enter()
        URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            if let data = data,
               let imageArray = try? JSONDecoder().decode([CatImage].self, from: data),
               let image = imageArray.first {
                catImage = image
            }
            group.leave()
        }.resume()
        
        group.notify(queue: .main) {
            if let fact = catFact?.data?.first, let image = catImage?.url {
                completion(fact, image)
            }
        }
    }
}
