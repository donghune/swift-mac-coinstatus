//
//  CoinSelectView.swift
//  coinstatus
//
//  Created by 유동훈 on 2021/05/11.
//

import SwiftUI

struct CoinSelectView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            getCoinList { dictionary in
                dictionary.forEach { (key: String, value: String) in
                    Text("\(key) \(value)")
                }
            }
        })
    }
}

struct CoinSelectView_Previews: PreviewProvider {
    static var previews: some View {
        CoinSelectView()
    }
}
