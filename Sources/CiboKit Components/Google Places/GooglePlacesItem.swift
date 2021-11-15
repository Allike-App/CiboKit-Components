//
//  GooglePlacesItem.swift
//  
//
//  Created by Ethan Lipnik on 11/14/21.
//

import Foundation

public struct GooglePlacesItem: Identifiable, Codable {
    public var id: String
    public var address: String?
    public var price,
               rating,
               userRatingsCount: Int?
    public var url,
               website: URL?
    public var photos: [PlacePhoto]?
    
    public enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case price = "price_level"
        case rating
        case url
        case userRatingsCount = "user_ratings_total"
        case address = "vicinity"
    }
    
    public struct PlacePhoto: Codable {
        public var height: Float
        public var width: Float
        public var photoReference: String
        
        public enum CodingKeys: String, CodingKey {
            case height
            case width
            case photoReference = "photo_reference"
        }
        
        func url(_ apiKey: String, maxWidth: Int = 400) -> URL? {
            return URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=\(maxWidth)&photo_reference=\(photoReference)&key=" + apiKey)
        }
    }
}
