//
//  Star.swift
//  Stars
//
//  Created by Niranjan Kumar on 10/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Star: Codable {

    let name: String
    let distance: Double
    
    var distanceDescription: String {
        return "\(distance) light years away"
    }
}

