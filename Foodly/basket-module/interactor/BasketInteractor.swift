//
//  BasketInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class BasketInteractor: PresenterToInteractorBasketProtocol {
    
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func getFoodsInBasket(userName: String) {
        
        var request = URLRequest(url:URL(string:Constants.baseGetBasketFoodURL)!)
        request.httpMethod = "POST"
        
        let postString = "kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
                    
            do {
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(FoodsInBasketResponse.self, from: data!)
                if let foodListInBasket = result.sepet_yemekler {
                    self.basketPresenter?.sendDataToPresenter(foodListInBasket: foodListInBasket)
                    
                }
            }
            catch let error as DecodingError {
                switch error {
                    case .typeMismatch(let key, let value):
                      print("error typeMismatch \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .valueNotFound(let key, let value):
                      print("error valueNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .keyNotFound(let key, let value):
                      print("error keyNotFound \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .dataCorrupted(let key):
                      //The given data was not valid JSON
                      print("error dataCorrupted \(key), and ERROR: \(error.localizedDescription)")
                    default:
                      print("ERROR: \(error.localizedDescription)")
                    }
                self.basketPresenter?.sendDataToPresenter(foodListInBasket: [])
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func deleteFoodFromBasket(sepet_yemek_id: Int, userName: String) {
        var request = URLRequest(url: URL(string: Constants.baseDeleteFoodFromBasketURL)!)
        request.httpMethod = "POST"
        
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do {
                let result = try JSONDecoder().decode(DeleteFromBasketResponse.self, from: data!)
                print(result)
                self.getFoodsInBasket(userName: userName)
                
                
             } catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
}
