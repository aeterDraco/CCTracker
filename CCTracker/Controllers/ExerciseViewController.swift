//
//  ExerciseViewController.swift
//  CCTracker
//
//  Created by Ricardo on 9/30/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class ExerciseViewController : UIViewController, UITableViewDelegate {
  
  var arrayTrainings = [Movement]()
  var todaysTraining = [String] ()
  var indexSelected = -1
  
  var training = Training()
  let reuseCellIdentifier = "ExerciseCell"
  
  
  @IBOutlet weak var tableExercises: UITableView!
  @IBOutlet weak var btnMenu: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu .addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    tableExercises.tableFooterView = UIView()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBarHidden = true
    loadWorkoutArray()
  }
  
  override func viewWillDisappear(animated: Bool) {
    indexSelected = -1
  }

  func loadWorkoutArray() {
    training = Training()
    arrayTrainings = training.workoutList()
    todaysTraining = [String]()
//    let todaysTrainings = training.readTodaysTraining()

//    for movement in todaysTrainings {
//      todaysTraining.append(movement.name)
//    }
    
    tableExercises.reloadData()
  }

  func setTodaysTraining(){
  }
    
  //MARK: - Table View Data Source Delegate
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayTrainings.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.row == indexSelected {
      return tableExercises.frame.size.height
    }else {
      return 68
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath) as! TrainingViewCell
    cell.backgroundColor = UIColor.clearColor()
    let currentMovement = arrayTrainings[indexPath.row] as Movement!
    
    cell.imgExerciseIcon?.image = currentMovement.iconMovement
    cell.lblExerciseName?.font = UIFont(name: Defaults.appFont, size: 15)
    cell.btnTraining.tag = indexPath.row
    
    let info = currentMovement.getStepInfo()
    cell.lblExerciseName?.text = String(format: "%@ %@: %@", currentMovement.name, info[0], info[1])
    
//    cell.viewTraining.thisSwitch.tag = indexPath.row
//    cell.viewTraining.lblTitle.text = String(format: "training view No: %d", indexPath.row)
    
    if todaysTraining.contains(currentMovement.name) {
      cell.lblExerciseName?.textColor = UIColor(red: 231/255.0, green: 169/255.0, blue: 34/255.0, alpha: 1.0)
    } else {
      cell.lblExerciseName?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    }
    
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  @IBAction func selectExercise(sender: UIButton) {
    if indexSelected == sender.tag {
      indexSelected = -1
    }else {
      indexSelected = sender.tag

      let exerciseView = tableExercises.cellForRowAtIndexPath(NSIndexPath.init(forRow: sender.tag, inSection: 0)) as! TrainingViewCell
    
//      print("open \(exerciseView.viewTraining.thisSwitch.tag) view with status \(exerciseView.viewTraining.thisSwitch.on)")

    }

    tableExercises.beginUpdates()
    tableExercises.endUpdates()
    
//
//    if exerciseView.viewTraining!.hidden {
//        exerciseView.viewTraining!.hidden = false
//        //            UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
//        exerciseView.viewTraining!.alpha = 1.0
//        //                }, completion: nil)
//        
//    } else {
//        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//            exerciseView.viewTraining!.alpha = 0.0
//            }, completion: {
//                (finished: Bool) -> Void in
//                
//                exerciseView.viewTraining!.hidden = true
//        })
//    }
    tableExercises.scrollToRowAtIndexPath(NSIndexPath(forRow: sender.tag, inSection: 0), atScrollPosition: .Top, animated: true)
  }
  
}