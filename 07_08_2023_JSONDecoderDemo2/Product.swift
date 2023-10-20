//
//  Product.swift
//  07_08_2023_JSONDecoderDemo2
//
//  Created by Vishal Jagtap on 20/10/23.
//

import Foundation
struct Product : Decodable{
    var id : Int
    var productName : String
    var price : Double
    var rate : Double
    var count : Int
    
    enum ProductKeys : String, CodingKey{
        case id, productName = "title", price, rating
    }

    enum RatingKeys : CodingKey{
        case rate
        case count
    }
    
    init(from decoder: Decoder) throws {
        let productContainer = try decoder.container(keyedBy: ProductKeys.self)
        self.id = try productContainer.decode(Int.self, forKey: .id)
        self.productName = try productContainer.decode(String.self, forKey: .productName)
        self.price = try productContainer.decode(Double.self, forKey: .price)
       
        let ratingContainer = try productContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        
        self.rate = try ratingContainer.decode(Double.self, forKey: .rate)
        self.count = try ratingContainer.decode(Int.self, forKey: .count)
    }
}
