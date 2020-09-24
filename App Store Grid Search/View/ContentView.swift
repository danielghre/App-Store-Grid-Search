//
//  ContentView.swift
//  App Store Grid Search
//
//  Created by Daniel Ghrenassia on 19/09/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = GridViewModel()
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                
                ActivityIndicatorView(isAnimating: $vm.isLoading, style: .medium)
                    .padding(.top, 10)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 80, maximum: 170), spacing: 32, alignment: .top),
                    GridItem(.flexible(minimum: 80, maximum: 170), spacing: 32, alignment: .top),
                    GridItem(.flexible(minimum: 80, maximum: 170), spacing: 32, alignment: .top)
                ], alignment: .leading, spacing: 16, content: {
                    ForEach(vm.results.filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self) { app in
                        AppInfo(app: app)
                    }     
                }).padding(.horizontal, 16)
                .padding(.top, 12)
            }.navigationTitle("App Store")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
