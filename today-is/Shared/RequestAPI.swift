//
//  RequestAPI.swift
//  today-is
//
//  Created by 이주열 on 2022/03/16.
//

import Foundation
import Alamofire
import UIKit

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
    @Published var addFoodResponse: String = ""
    @Published var savedImage: String = ""
    
    struct ImageFile {
        let filename: String
        let data: Data
        let type: String
    }
    
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
    
    func addFood(parameters: [String: String]) {
        let requestURL = "http://localhost:3000/food/"
        if let url = URL(string: requestURL) {
            var request = URLRequest.init(url: url)
            let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.sync {
                    guard let data = data else { return }
                    print(data)
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(AddFood.self, from: data) {
                        print("Successfully AddFood")
    //                      print(json)
                        self.addFoodResponse = json.message!
                    }
                }
            }
            
            task.resume()
        }
    }
    
    // 이미지 전송 api 추가하기
    func uploadImage(imgData: UIImage?, completion: @escaping (String) -> Void)  {
        guard let imgData = imgData else {
            return
        }
        
        print(imgData.size)
        let imageData = resizeImage(image: imgData, height: 190)
        print(imageData.size)
        
        let image: Data? = imageData.pngData()
        guard let image = image else {
            return
        }
        
//        let urlComponent = URLComponents(string: "http://localhost:3000/image")
        let header: HTTPHeaders = [ "Content-Type": "multipart/form-data" ]
//        guard let url = urlComponent?.url else { return }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(image, withName: "image", fileName: "foodImage.png", mimeType: "image/png")
        }, to: "http://localhost:3000/image", method: .post, headers: header).responseDecodable(of: ImageUpload.self) { response in
            print("Upload image Success")
            guard let data = response.data else { return }
            if let decodedData = try? JSONDecoder().decode(ImageUpload.self, from: data) {
                print(decodedData)
                self.savedImage = decodedData.message!
                completion(decodedData.message!)
            }
        }
    }
    
    func resizeImage(image: UIImage, height: CGFloat) -> UIImage {
        let scale = height / image.size.height
        let width = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
