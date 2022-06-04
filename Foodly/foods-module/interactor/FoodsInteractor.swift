//
//  FoodsInteractor.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodsInteractor: PresenterToInteractorFoodsProtocol {
    var foodsPresenter: InteractorToPresenterFoodsProtocol?
    
    func getFoods() {
        
        let url = URL(string:Constants.baseGetFoodsURL)!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            do {
                let response = try JSONDecoder().decode(FoodsResponse.self, from: data!)
                if let list = response.yemekler {
                    self.foodsPresenter?.sendDataToPresenter(foodList:list )
                }
             } catch{print(error.localizedDescription)}
        }.resume()
    }
}
