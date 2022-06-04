//
//  FoodInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodDetailInteractor: PresenterToInteractorFoodDetailProtocol {
    func postFoodToBasket(foodName: String, foodImageName: String, foodPrice: Int, foodOrderQuantity: Int, userName: String) {
        
        var request = URLRequest(url: URL(string: Constants.basePostFoodToBasketURL)!)
        request.httpMethod = "POST"
        
        let postString = "yemek_adi=\(foodName)&yemek_resim_adi=\(foodImageName)&yemek_fiyat=\(foodPrice)&yemek_siparis_adet=\(foodOrderQuantity)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            do{
                let result = try JSONDecoder().decode(AddingFoodToBasket.self, from: data!)
                print(result.message ?? "No message")
             } catch{print(error.localizedDescription)}
        }.resume()
    }
    
}
