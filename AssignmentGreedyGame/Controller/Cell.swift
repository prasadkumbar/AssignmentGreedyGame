//
//  Cell.swift
//  AssignmentGreedyGame
//
//  Created by I0039 on 04/01/20.
//  Copyright © 2020 I0039. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albulId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
