//
//  Coin.swift
//  coinstatus
//
//  Created by 유동훈 on 2021/05/11.
//

import Foundation
import Alamofire

var coins : [String] = []

func getCoinList(callback: @escaping ([String:String]) -> Void) {
    AF.request("https://api.upbit.com/v1/market/all", method: .get)
        .responseJSON { response in
            switch response.result {
            case.success(let value):
                var coinDictionary : [String:String] = [:]
                if let nsArray = value as? NSArray {
                    nsArray.forEach { array in
                        if let dictionary = array as? NSDictionary {
                            let key = dictionary["market"] as! String
                            let value = dictionary["korean_name"] as! String
                            coinDictionary[key] = value
                        }
                    }
                }
                callback(coinDictionary)
                break
            case .failure(_): break
            }
        }
}

func setCoins(input: [String]) {
    coins = input
}

func updateTradePrice( block: @escaping (String) -> Void) {
    AF.request("https://api.upbit.com/v1/ticker?markets=\(coins.joined(separator: ","))", method: .get)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let nsArray = value as? NSArray {
                        var price : [String] = []
                        nsArray.forEach { value in
                            if let dictionary = value as? NSDictionary {
                                if let tradePrice = dictionary["trade_price"] as? Int {
                                    price.append(String(tradePrice))
                                }
                            }
                        }
                        block(price.joined(separator: " "))
                    }
                case .failure(_): break
                    
                }
            }
}
