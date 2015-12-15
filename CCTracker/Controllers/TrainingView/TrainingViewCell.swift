//
//  TrainingView.swift
//  CCTracker
//
//  Created by Ricardo on 10/2/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import UIKit

protocol TrainingViewCellDelegate {
  func cellHeaderTapped(tagSelected: Int)
}

class TrainingViewCell: UITableViewCell, UITableViewDataSource, UIPickerViewDataSource, {

  
  @IBOutlet weak var scrollExerciseDescription: UIScrollView!
  @IBOutlet weak var viewTitle: UIView!
  @IBOutlet weak var lblExerciseName: UILabel!
  @IBOutlet weak var btnTraining: UIButton!
  @IBOutlet weak var imgExerciseIcon: UIImageView!
  @IBOutlet weak var trainingView: UIView!
  
  @IBOutlet weak var constraint_scrollTraining_height: NSLayoutConstraint!
  @IBOutlet weak var constraint_titleView_height: NSLayoutConstraint!

  var imgTutorial: UIImageView?
  
  var trainingViewCellDelegate: TrainingViewCellDelegate!
  
  let colorExerciseNotToday = UIColor.clearColor()
  let colorExerciseToday    = UIColor(red: 231/255.0, green: 169/255.0, blue: 34/255.0, alpha: 1.0)

  @IBAction func exerciseSelectedAction(sender: UIButton) {
    self.trainingViewCellDelegate.cellHeaderTapped(sender.tag)
  }
  
  func setUpExerciseInfo(movementInfo: Movement, indexPathRow: Int, isTodaysTraining: Bool) {
    imgExerciseIcon?.image = movementInfo.iconMovement
    lblExerciseName?.font = UIFont(name: Defaults.appFont, size: 15)
    btnTraining.tag = indexPathRow
    
    let info = movementInfo.getStepInfo()
    lblExerciseName?.text = String(format: "%@ %@: %@", movementInfo.name, info[0], info[1])
    
    if isTodaysTraining {
      lblExerciseName?.textColor = UIColor(red: 231/255.0, green: 169/255.0, blue: 34/255.0, alpha: 1.0)
    } else {
      lblExerciseName?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    }
    
    viewTitle.backgroundColor = isTodaysTraining ? self.colorExerciseToday:self.colorExerciseNotToday
    
    
    let currentExercise = movementInfo.getCurrentExercise()
    let imageName = currentExercise.imgDescriptions[0]
    imgTutorial = UIImageView(frame: CGRectMake(0, 0, scrollExerciseDescription.frame.width, scrollExerciseDescription.frame.height))
    imgTutorial!.image = UIImage(named: imageName)
    imgTutorial!.contentMode = .ScaleAspectFit
    
    scrollExerciseDescription.contentSize = imgTutorial!.frame.size
    scrollExerciseDescription.addSubview(imgTutorial!)
    
    
    
  }
  
  //MARK: - UIPickerDelegates Methods
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    
  }

  
//  @IBOutlet var view: UIView!
//    @IBOutlet weak var lblTitle: UILabel!
//    
//    @IBOutlet weak var thisSwitch: UISwitch!
//  @IBAction func switchTapped(sender: UISwitch) {
//    print("switch from cell \(sender.tag) changed to turned \(sender.on)")
//  }
//  
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    
//    NSBundle.mainBundle().loadNibNamed("TrainingView", owner: self, options: nil)
//    
//    self.view.frame = bounds
//    self.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
//    
//    self.addSubview(self.view)
//  }
//  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    NSBundle.mainBundle().loadNibNamed("TrainingView", owner: self, options: nil)
//    
//    self.view.frame = bounds
//    self.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
//    
//    self.addSubview(self.view)
//  }

  
  
}
