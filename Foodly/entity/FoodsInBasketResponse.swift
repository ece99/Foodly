//
//  FoodsInBasketResponse.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

class FoodsInBasketResponse: Codable {
    var sepet_yemekler : [FoodsInBasket]?
    var success: Int?
}