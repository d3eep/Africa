//
//  VideoModel.swift
//  Africa
//
//  Created by Deep Bose on 5/29/21.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    
    var thumbnail: String {
        "video-\(id)"
    }
}
