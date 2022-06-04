//
//  FoodsResponse.swift
//  Foodly
//
//  Created by Ece Ayvaz on 28.05.2022.
//

import Foundation

struct FoodsResponse : Codable {
    var yemekler: [Foods]?
    var success:Int?
}
