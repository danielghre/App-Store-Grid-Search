//
//  GridViewModel.swift
//  App Store Grid Search
//
//  Created by Daniel Ghrenassia on 19/09/2020.
//

import SwiftUI

class GridViewModel: ObservableObject {
    
    @Published var results = [Result]()
    @Published var isLoading: Bool = true
    
    init() {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/fr/ios-apps/top-grossing/all/100/explicit.json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data else {
                return
            }
            do {
                let rss = try JSONDecoder().decode(RSS.self, from: data)
                DispatchQueue.main.async {
                    self.results = rss.feed.results
                    self.isLoading = false
                }
            } catch {
               print("Failed to decode: \(error)")
           }
        }.resume()
    }
}
