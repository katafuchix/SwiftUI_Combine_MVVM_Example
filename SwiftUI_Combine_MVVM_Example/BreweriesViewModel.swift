//
//  BreweriesViewModel.swift
//  SwiftUI_Combine_MVVM_Example
//
//  Created by cano on 2023/04/23.
//

import Combine
import SwiftUI

class BreweriesViewModel: ObservableObject {
    @Published var breweries: [BreweryModel] = []
    
    private var breweriesService = BreweriesService()
    
    func fetchBreweries() {
        breweriesService.getBreweries().assign(to: &$breweries)
    }
}

struct BreweriesService {
    func getBreweries() -> AnyPublisher<[BreweryModel], Never> {
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            return Just([]).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
          .map(\.data)
          .decode(type: [BreweryModel].self, decoder: JSONDecoder())
          .replaceError(with: [])
          .receive(on: RunLoop.main)
          .eraseToAnyPublisher()
    }
}

