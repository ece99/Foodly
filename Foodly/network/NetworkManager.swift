//
//  NetworkManager.swift
//  Foodly
//
//  Created by Ece Ayvaz on 4.06.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    
    let reachabilityManager = NetworkReachabilityManager()?.isReachable
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager ?? false
    }
}
