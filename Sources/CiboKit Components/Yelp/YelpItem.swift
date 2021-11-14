//
//  YelpItem.swift
//  
//
//  Created by Ethan Lipnik on 11/6/21.
//

import Foundation

public struct YelpItem: Identifiable, Codable {
    public var id,
        phone,
        alias,
        name: String
    public var price: String?
    public var coordinates: Coordinates
    public var imageURL: String?
    public var distance,
        rating: Float
    public var categories: [Category]
    public var location: Self.Location
    public var url: URL
    
    public enum CodingKeys: String, CodingKey {
        case id
        case phone
        case alias
        case name
        case coordinates
        case imageURL = "image_url"
        case distance
        case rating
        case categories
        case location
        case price
        case url
    }
    
    public struct Category: Codable {
        public var alias,
            title: String
    }
    
    public struct Location: Codable {
        public var address1,
            address2,
            address3: String?
        public var city,
            country,
            state,
            zipCode: String
        
        public enum CodingKeys: String, CodingKey {
            case address1
            case address2
            case address3
            case city
            case country
            case state
            case zipCode = "zip_code"
        }
    }
}
