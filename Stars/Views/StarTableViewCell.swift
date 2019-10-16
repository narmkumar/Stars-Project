//
//  StarTableViewCell.swift
//  Stars
//
//  Created by Niranjan Kumar on 10/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let star = star else { return }
        
        nameLabel.text = star.name
        distanceLabel.text = star.distanceDescription
        // "\(star.distance) light years away" -> can also be used
        
        
    }
    
    
}
