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
  var indexSelected = -1
  
  let training = Training()
  let reuseCellIdentifier = "ExerciseCell"
  
  
  @IBOutlet weak var tableExercises: UITableView!
  @IBOutlet weak var btnMenu: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu .addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    tableExercises.tableFooterView = UIView()
    loadWorkoutArray()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBarHidden = true
  }
  
  override func viewWillDisappear(animated: Bool) {
    indexSelected = -1
  }

  func loadWorkoutArray() {
    arrayTrainings = training.workoutList()
    tableExercises.reloadData()
  }
  
  //MARK: - Table View Data Source Delegate
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayTrainings.count
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if indexPath.row == indexSelected {
//      let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath) as! ExerciseCell
//      cell.viewTraining.hidden = false
      return tableExercises.frame.size.height
    }else {
      return 70
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath) as! ExerciseCell
    cell.backgroundColor = UIColor.clearColor()
    let currentMovement = arrayTrainings[indexPath.row]
    
    cell.imgExerciseIcon?.image = currentMovement.iconMovement
    cell.lblTitle?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    cell.lblTitle?.font = UIFont(name: Defaults.appFont, size: 15)
    cell.btnSelectCell.tag = indexPath.row
    
    let info = currentMovement.getStepInfo()
    cell.lblTitle?.text = String(format: "%@ %@: %@", currentMovement.name, info[0], info[1])
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
    }
    
    tableExercises.beginUpdates()
    tableExercises.endUpdates()
    tableExercises.scrollToRowAtIndexPath(NSIndexPath(forRow: sender.tag, inSection: 0), atScrollPosition: .Top, animated: true)
  }
  
}