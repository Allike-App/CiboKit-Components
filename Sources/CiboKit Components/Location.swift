//
//  Location.swift
//  
//
//  Created by Ethan Lipnik on 11/6/21.
//

import Foundation

public struct Location: Identifiable, Codable, Equatable, Hashable {
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: String
    
    public var title: String?
    public var imageURL: URL?
    public var coordinates: Coordinates?
    public var address: String?
    public var city: String?
    public var phone: String?
    public var distance: Float?
    public var zipCode: String?
    public var rating: Float?
    public var category: String?
    public var price: Int?
    
    public init(_ yelpItem: YelpItem) {
        self.id = yelpItem.id
        self.title = yelpItem.name
        self.coordinates = yelpItem.coordinates
        self.address = yelpItem.location.address1 ?? yelpItem.location.address2 ?? yelpItem.location.address3 ?? ""
        self.city = yelpItem.location.city
        self.phone = yelpItem.phone
        self.distance = yelpItem.distance
        self.zipCode = yelpItem.location.zipCode
        self.rating = yelpItem.rating
        self.category = yelpItem.categories.first?.title ?? ""
        self.price = yelpItem.price?.count ?? 1
        
        if let imageURL = yelpItem.imageURL {
            self.imageURL = URL(string: imageURL)
        }
    }
    
    public init(_ place: GooglePlacesItem, apiKey: String? = nil, maxPhotoWidth: Int = 400) {
        self.id = place.id
        self.title = place.name
        self.address = place.address
        self.rating = place.rating != nil ? Float(place.rating!) : nil
        self.price = place.price
        
        if let apiKey = apiKey {
            self.imageURL = place.photos?.first?.url(apiKey, maxWidth: maxPhotoWidth)
        }
    }
    
    public init(id: String = UUID().uuidString,
                title: String,
                imageURL: URL,
                coordinates: Coordinates,
                address: String,
                city: String,
                phone: String,
                distance: Float,
                zipCode: String,
                rating: Float,
                category: String,
                price: Int) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.coordinates = coordinates
        self.address = address
        self.city = city
        self.phone = phone
        self.distance = distance
        self.zipCode = zipCode
        self.rating = rating
        self.category = category
        self.price = price
    }
}
