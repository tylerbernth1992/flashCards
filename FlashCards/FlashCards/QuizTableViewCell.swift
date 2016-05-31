//
//  SubjectTableViewCell.swift
//  FlashCards
//
//  Created by Tyler Bernth on 3/27/16.
//  Copyright © 2016 Tyler Bernth. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    //MARK Properties

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var operation: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
