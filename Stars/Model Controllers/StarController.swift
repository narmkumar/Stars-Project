//
//  StarController.swift
//  Stars
//
//  Created by Niranjan Kumar on 10/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class StarController {

   private(set) var stars: [Star] = []

    init() {
        loadFromPersistentStore()
    }
    
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistentStore()
        return star
    }
    
    func listStars() -> String {
        var output = ""
        for star in stars {
            output += "\(star.name) is \(star.distanceDescription).\n"
        }
        return output
    }
    
    
    
    // MARK: - Persistence
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("stars.plist")
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL,
            fm.fileExists(atPath: url.path) else { return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
          print("Error loading stars data: \(error)")
        }
    }
    
    
    private func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
            
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url) // like save button in word, it saves all the data into the file.
            } catch {
              print("Error loading stars data: \(error)")
            }
    }
    
    
}

