//
//  HomeEntity.swift
//  ViperWallet
//
//  Created by Mahmut Gazi Doğan on 16.10.2023.
//

import Foundation

// MARK: - ProfileModel

struct ResponseModel {
    let status: String?
    let data: DataClass?
}

// MARK: - DataClass

struct DataClass {
    let markets: [Market]?
}

// MARK: - Market
struct Market {
    let marketCode, urlSymbol, baseCurrency: String?
    let minimumOrderAmount, maximumOrderAmount: String?
    let baseCurrencyDecimal, counterCurrencyDecimal, presentationDecimal: Int?
    let resellMarket: Bool?
    let minMultiplier, maxMultiplier: String?
    let listDate: Int?
    let baseCurrencyName: String?
}
