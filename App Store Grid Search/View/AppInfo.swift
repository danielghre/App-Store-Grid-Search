//
//  AppInfo.swift
//  App Store Grid Search
//
//  Created by Daniel Ghrenassia on 19/09/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct AppInfo: View {
    
    let app: Result
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            KFImage(URL(string: app.artworkUrl100))
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            
            Text(app.name)
                .font(.system(size: 14, weight: .semibold))
                .padding(.top, 4)
            Text(app.releaseDate)
                .font(.system(size: 12, weight: .regular))
            Text(app.copyright)
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}
