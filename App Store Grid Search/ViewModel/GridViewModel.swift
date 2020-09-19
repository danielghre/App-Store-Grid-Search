//
//  GridViewModel.swift
//  App Store Grid Search
//
//  Created by Daniel Ghrenassia on 19/09/2020.
//

import Foundation

class GridViewModel: ObservableObject {
    
    @Published var results = [Result]()
    
    init() {
//        Simulate json downloading
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
//            self.items = 0..<15
//        }
       
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/fr/ios-apps/top-free/all/100/explicit.json") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data else {
                return
            }
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data)
                self.results = rss.feed.results
            } catch {
               print("Failed to decode: \(error)")
           }
        }.resume()
    }
}
