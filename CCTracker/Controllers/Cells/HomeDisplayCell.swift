//
//  HomeDisplayCell.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import UIKit

class HomeDisplayCell: UITableViewCell {
  
  @IBOutlet weak var imgExercise: UIImageView!
  @IBOutlet weak var lblExerciseName: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}