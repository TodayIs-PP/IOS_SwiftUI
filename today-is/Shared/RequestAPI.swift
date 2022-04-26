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
    @Published var result: [Food] = []
    @Published var addFoodCategory: [String] = []
    
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
    
    func getAddFoodCategory() {
        if let url = URL(string: "http://localhost:3000/category/addFoodCategories") {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
              DispatchQueue.main.sync {
                  guard let data = data else { return }
                  print(data)
                  let decoder = JSONDecoder()
                  if let json = try? decoder.decode(GetCategories.self, from: data) {
                      print("Successfully resived getAddFoodCategory")
                      print(json)
                      self.addFoodCategory = json.data!
                  }
              }
          }.resume()
        }
    }
    
    func getFoods() {
        if let url = URL(string: "http://localhost:3000/food/foods") {
            var request = URLRequest.init(url: url)
            var result: [Food]?

            request.httpMethod = "GET"
            let semaphore = DispatchSemaphore(value: 0)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                print(data)
                let decoder = JSONDecoder()
                guard let json = try? decoder.decode(GetFoods.self, from: data) else {
                    print("Fail to getFoods")
                    return
                }
                print("Successfully resived getFoods")
//                      print(json)
                
                result = json.data!
                semaphore.signal()
            }
            
            task.resume()
            semaphore.wait()
            self.foods = result!
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
//                  print(json)
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
    
    func getResult(answers: [String]) {
        let requestURL = "http://localhost:3000/question/result?detailKind1=\(answers[0])&detailKind2=\(answers[1])&kind1=\(answers[2])&kind2=\(answers[3])&flavor1=\(answers[4])&flavor2=\(answers[5])"
        let encodedString = requestURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: encodedString) {
          var request = URLRequest.init(url: url)

          request.httpMethod = "GET"

          URLSession.shared.dataTask(with: request) { (data, response, error) in
              DispatchQueue.main.sync {
                  guard let data = data else { return }
                  print(data)
                  let decoder = JSONDecoder()
                  if let json = try? decoder.decode(GetFoods.self, from: data) {
                      print("Successfully resived getResult")
//                      print(json)
                      self.result = json.data!
                  }
              }
          }.resume()
        }
    }
    
    func addFood(body: [String: String], image: ImageFile?) {
        let boundary = "Boundary-\(UUID().uuidString)"
        guard let url = URL(string: "http://localhost:3000/food") else {
            print("Fail to convert url")
            return
        }

        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"

        // Header
        request.setValue("multipart/form-data; boundary\(boundary)",
                forHTTPHeaderField: "Content-Type")

        // Body
        let bodyData = createBody(parameters: body, boundary: boundary, image: image)
        request.httpBody = bodyData
    }
    
    func createBody(parameters: [String: Any], boundary: String, image: ImageFile?) -> Data {
        var body = Data()
        let boundaryPrefix = "--\(boundary)\r\n"

        for (key, value) in parameters {
            body.append(boundaryPrefix.data(using: .utf8)!)
          body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        }

        // image를 첨부하지 않아도 작동할 수 있도록 if let을 통해 images 여부 확인
        // requst의 key값의 이름에 따라 name의 값을 변경
        if let visibleImage = image {
            body.append(boundaryPrefix.data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"images[]\"; filename=\"\(visibleImage.filename)\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/\(visibleImage.type)\r\n\r\n".data(using: .utf8)!)
            body.append(visibleImage.data)
            body.append("\r\n".data(using: .utf8)!)
        }

        body.append(boundaryPrefix.data(using: .utf8)!)

        return body
    }
}
