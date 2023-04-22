//
//  ContentView.swift
//  SwiftUI_Combine_MVVM_Example
//
//  Created by cano on 2023/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = BreweriesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.breweries, id: \.id) {
                BreweryView(brewery: $0)
            }.navigationBarTitle("Breweries")
        }
        .padding([.bottom], 20)
        .task {
            self.viewModel.fetchBreweries()
            
            /*
            // Codableのデバッグ
            let str : String = "https://api.openbrewerydb.org/breweries"
            let url : URL = URL(string: str)!
            
            // URLRequestを生成してJSONのデータを取得
            let request: URLRequest = URLRequest(url:url)
            let session = URLSession.shared
            let task : URLSessionDataTask = session.dataTask(with: request, completionHandler: {(data, response, error) in
                // エラーがあれば表示
                if(error != nil) {
                    print(error ?? "")
                    return
                }
                
                // APIからの戻り値がなければ処理を終了
                guard let responseData = data else{ return }
                
                do {
                    print(responseData)
                    // JSONDecoderクラスのインスタンスを生成
                    let decoder = JSONDecoder()
                    // JSONを解析して作成した構造体の通りにマッピング
                    let resultList = try decoder.decode([BreweryModel].self, from: responseData)
                    // JSONを解析した後、構造体にマッピングされたデータを取り出す
                    for obj in resultList{
                        print(obj)
                    }
                } catch {
                    print("JSONの解析でエラーが起きました")
                }
            })
            task.resume()
            */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
