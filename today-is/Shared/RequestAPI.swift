//
//  RequestAPI.swift
//  today-is
//
//  Created by 이주열 on 2022/03/16.
//

import Foundation

class RequestAPI: ObservableObject {
    static let shard = RequestAPI()
    @Published var hello: String = "byebye"
    @Published var categories: [String] = []
    @Published var foods: [Food] = []
    
    func getHello() -> String {
        do {
            let url = URL(string: "http://localhost:3000/hello")
            let response = try String(contentsOf: url!)
            
            self.hello = response
            print(response)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return hello
    }
    
    func getCategory() {
        if let url = URL(string: "http://localhost:3000/category/categories") {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
              print(data)
              let decoder = JSONDecoder()
              if let json = try? decoder.decode(GetCategories.self, from: data) {
                  print("Successfully resived getCategory")
//                  print(json)
                  self.categories = json.data!
              }
          }.resume()
        }
    }
    
    func getFoods() {
        if let url = URL(string: "http://localhost:3000/food/foods") {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
              print(data)
              let decoder = JSONDecoder()
              if let json = try? decoder.decode(GetFoods.self, from: data) {
                  print("Successfully resived getFoods")
//                  print(json)
                  self.foods = json.data!
              }
          }.resume()
        }
    }
}
