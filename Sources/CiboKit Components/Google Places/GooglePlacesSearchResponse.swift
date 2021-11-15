//
//  GooglePlacesSearchResponse.swift
//  
//
//  Created by Ethan Lipnik on 11/14/21.
//

import Foundation

public struct GooglePlacesSearchResponse: Codable {
    public var results: [GooglePlacesItem]
}
