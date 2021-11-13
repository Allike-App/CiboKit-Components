//
//  YelpSearchResponse.swift
//  
//
//  Created by Ethan Lipnik on 11/6/21.
//

import Foundation

public struct YelpSearchResponse: Decodable {
    public var businesses: [YelpItem]
}
