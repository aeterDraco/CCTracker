//
//  ExerciseView.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class ExerciseView: UIViewController, ExerciseViewProtocol, UITableViewDelegate, UITableViewDataSource {
  
  var presenter: ExercisePresenterProtocol?
  
  //MARK: - Variables
  
  var arrayTrainings = [Movement]()
  var currentSteps   = [String:Int]()
  var todaysTraining = [String]()
  var indexSelected  = -1
  
  let reuseCellIdentifier = "TrainingCell"
  
  @IBOutlet weak var tableExercises: UITableView!
  @IBOutlet weak var btnMenu: UIButton!

  //MARK: - UIViewController Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu.addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    tableExercises.tableFooterView = UIView()
    self.presenter!.updateView()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBarHidden = true
    //loadWorkoutArray()
  }
  
  override func viewWillDisappear(animated: Bool) {
    indexSelected = -1
  }

  //MARK: - Tablew View Delegates
  
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

  //MARK: - ExercisePresenterProtocol Methods

  func displayCurrentStepsInfo(currentSteps: [String: Int]) {
    self.currentSteps = currentSteps
  }

}
