//
//  BreweryView.swift
//  SwiftUI_Combine_MVVM_Example
//
//  Created by cano on 2023/04/23.
//

import SwiftUI

struct BreweryView: View {
    private let brewery: BreweryModel
    init(brewery: BreweryModel) {
        self.brewery = brewery
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "beer")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 15) {
                Text(brewery.name)
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
                Text("\(brewery.city) - \(brewery.street ?? "")")
                    .font(.system(size: 14))
            }
        }
    }
}
