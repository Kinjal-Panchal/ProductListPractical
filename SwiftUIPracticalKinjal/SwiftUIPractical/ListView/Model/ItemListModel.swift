//
//  ItemListModel.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import Foundation

// MARK: - RootProduct
struct RootProduct: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let citrusID: String?
    let title, id: String
    let imageURL: String
    let price: [Price]
    let brand: String
    let badges: [String]
    let ratingCount: Double
    let messages: Messages
    let isAddToCartEnable: Bool
    let addToCartButtonText: AddToCartButtonText
    let isInTrolley, isInWishlist: Bool
    let purchaseTypes: [PurchaseTypeElement]
    let isFindMeEnable: Bool
    let saleUnitPrice: Double
    let totalReviewCount: Int
    let isDeliveryOnly, isDirectFromSupplier: Bool

    enum CodingKeys: String, CodingKey {
        case citrusID = "citrusId"
        case title, id, imageURL, price, brand, badges, ratingCount, messages, isAddToCartEnable, addToCartButtonText, isInTrolley, isInWishlist, purchaseTypes, isFindMeEnable, saleUnitPrice, totalReviewCount, isDeliveryOnly, isDirectFromSupplier
    }
    
    init(citrusID: String?, title: String, id: String, imageURL: String, price: [Price], brand: String, badges: [String], ratingCount: Double, messages: Messages, isAddToCartEnable: Bool, addToCartButtonText: AddToCartButtonText, isInTrolley: Bool, isInWishlist: Bool, purchaseTypes: [PurchaseTypeElement], isFindMeEnable: Bool, saleUnitPrice: Double, totalReviewCount: Int, isDeliveryOnly: Bool, isDirectFromSupplier: Bool) {
        self.citrusID = citrusID
        self.title = title
        self.id = id
        self.imageURL = imageURL
        self.price = price
        self.brand = brand
        self.badges = badges
        self.ratingCount = ratingCount
        self.messages = messages
        self.isAddToCartEnable = isAddToCartEnable
        self.addToCartButtonText = addToCartButtonText
        self.isInTrolley = isInTrolley
        self.isInWishlist = isInWishlist
        self.purchaseTypes = purchaseTypes
        self.isFindMeEnable = isFindMeEnable
        self.saleUnitPrice = saleUnitPrice
        self.totalReviewCount = totalReviewCount
        self.isDeliveryOnly = isDeliveryOnly
        self.isDirectFromSupplier = isDirectFromSupplier
    }
    
    static func getProduct() -> Product  {
        Product(citrusID: "display_1_F_Al-mgtjXrg-pn33UYREA0P0KCgoIRE1fMjMxMjQSABoMCP2us5YGEJrokdEDIgIIAQ==", title: "Diamond Label Shiraz", id: "23124", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: .inAnySix, value: 9.40, isOfferPrice: false)], brand: "Rosemount", badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], ratingCount: 4.0, messages: Messages(secondaryMessage: "Sponsored", sash: Sash(), promotionalMessage: ""), isAddToCartEnable: true, addToCartButtonText: .addToCart, isInTrolley: false, isInWishlist: false, purchaseTypes: [PurchaseTypeElement(purchaseType: .bottle, displayName: .perBottle, unitPrice: 0.0, minQtyLimit: 0, maxQtyLimit: 1, cartQty: 0)], isFindMeEnable: false, saleUnitPrice: 1.0, totalReviewCount: 0, isDeliveryOnly: false, isDirectFromSupplier: false)
    }
   
    
}

enum AddToCartButtonText: String, Decodable {
    case addToCart = "Add to cart"
    case editQuantity = "Edit quantity"
}

// MARK: - Messages
struct Messages: Decodable {
    let secondaryMessage: String?
    let sash: Sash
    let promotionalMessage: String?
}

// MARK: - Sash
struct Sash: Decodable {
}

// MARK: - Price
struct Price: Decodable {
    let message: Message
    let value: Double
    let isOfferPrice: Bool
}

enum Message: String, Codable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}

// MARK: - PurchaseTypeElement
struct PurchaseTypeElement: Decodable {
    let purchaseType: PurchaseTypeEnum
    let displayName: DisplayName
    let unitPrice: Double
    let minQtyLimit, maxQtyLimit, cartQty: Int
}

enum DisplayName: String, Decodable {
    case case6 = "case (6)"
    case each = "each"
    case perBottle = "per bottle"
    case perCaseOf6 = "per case of 6"
}

enum PurchaseTypeEnum: String, Decodable {
    case bottle = "Bottle"
    case purchaseTypeCase = "Case"
}
