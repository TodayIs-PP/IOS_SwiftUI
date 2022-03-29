//
//  RequestAPI.swift
//  today-is
//
//  Created by 이주열 on 2022/03/16.
//

import Foundation

class RequestAPI: ObservableObject {
    static let shard = RequestAPI()
//    @Published var hello: String = "byebye"
    @Published var categories: [String] = []
    @Published var foods: [Food] = []
    @Published var foodsByCategory: [Food] = []
    @Published var searchFoods: [Food] = []
    @Published var tastes: [String] = []
    
//    func getHello() {
//        do {
//            let url = URL(string: "http://localhost:3000/hello")
//            let response = try String(contentsOf: url!)
//
//            self.hello = response
//            print(response)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }
    
    func getCategory() {
        if let url = URL(string: "http://localhost:3000/category/categories") {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
              DispatchQueue.main.sync {
                  guard let data = data else { return }
                  print(data)
                  let decoder = JSONDecoder()
                  if let json = try? decoder.decode(GetCategories.self, from: data) {
                      print("Successfully resived getCategory")
    //                  print(json)
                      self.categories = json.data!
                  }
              }
          }.resume()
        }
    }
    
    func getFoods() {
        if let url = URL(string: "http://localhost:3000/food/foods") {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
              DispatchQueue.main.sync {
                  guard let data = data else { return }
                  print(data)
                  let decoder = JSONDecoder()
                  if let json = try? decoder.decode(GetFoods.self, from: data) {
                      print("Successfully resived getFoods")
    //                  print(json)
                      self.foods = json.data!
                  }
              }
          }.resume()
        }
    }
    
    func getFoodsByCategory(category: String) {
        let urlString = "http://localhost:3000/category/?name=\(category)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: encodedString) {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
              guard error == nil else {
                  print("오류 : \(String(describing: error))")
                  return
              }
              
              DispatchQueue.main.sync {
                  guard let data = data else { return }
                  print(data)
                  let decoder = JSONDecoder()
                  if let json = try? decoder.decode(GetFoods.self, from: data) {
                      print("Successfully resived getFoodsByCategory")
    //                  print(json)
                      self.foodsByCategory = json.data!
                  }
              }
          }.resume()
        }
    }
    
    func getSearchResult(searchText: String){
        let urlString = "http://localhost:3000/food/search?searchFood=\(searchText)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: encodedString) {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
              print(data)
              let decoder = JSONDecoder()
              if let json = try? decoder.decode(GetFoods.self, from: data) {
                  print("Successfully resived getSearchResult")
                  print(json)
                  self.searchFoods = json.data!
              }
          }.resume()
        }
    }
    
    func getTastes() {
        if let url = URL(string: "http://localhost:3000/question/tastes") {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
              DispatchQueue.main.sync {
                  guard let data = data else { return }
                  print(data)
                  let decoder = JSONDecoder()
                  if let json = try? decoder.decode(GetTastes.self, from: data) {
                      print("Successfully resived getTastes")
//                      print(json)
                      self.tastes = json.data!
                  }
              }
          }.resume()
        }
    }
}
