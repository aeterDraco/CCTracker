//
//  ExerciseView.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class ExerciseView: UIViewController, ExerciseViewProtocol, UITableViewDelegate, UIPickerViewDelegate, TrainingViewCellDelegate {
  
  var presenter: ExercisePresenterProtocol?
  
  //MARK: - Variables
  
  var arrayTrainings = [Movement]()
  var currentSteps   = [String:Int]()
  var todaysTraining = [Movement]()
  var indexSelected  = -1
  
  let reuseCellIdentifier = "TrainingCell"
  
  @IBOutlet weak var tableExercises: UITableView!
  @IBOutlet weak var btnMenu: UIButton!

  //MARK: - UIViewController Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu.addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    tableExercises.tableFooterView = UIView()
    
    let nib = UINib(nibName: "TrainingViewCell", bundle: nil)
    tableExercises.registerNib(nib, forCellReuseIdentifier: reuseCellIdentifier)

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
      print("selected cell height  \(tableExercises.frame.size.height)")
      return tableExercises.frame.size.height
    }else {
      return (tableExercises.frame.size.height/CGFloat(arrayTrainings.count))
    }
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let currentMovement = arrayTrainings[indexPath.row] as Movement!

    let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath) as! TrainingViewCell
    cell.backgroundColor = UIColor.clearColor()
    cell.setUpExerciseInfo(currentMovement, indexPathRow: indexPath.row, isTodaysTraining: todaysTraining.contains(currentMovement))
    cell.trainingViewCellDelegate = self

    cell.constraint_titleView_height.constant = (tableExercises.frame.size.height/CGFloat(arrayTrainings.count))
    
    if indexPath.row == indexSelected {
      cell.constraint_scrollTraining_height.constant = tableExercises.frame.size.height - cell.constraint_titleView_height.constant
      print("tableView \(tableExercises.frame.size.height)")
      print("celHeader \(cell.constraint_titleView_height.constant)")
      print("exerciseDescription \(cell.constraint_scrollTraining_height.constant)")
      
    } else {
      cell.constraint_scrollTraining_height.constant = 0
    }
    
    self.view.layoutIfNeeded()
    
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  //MARK: - ExercisePresenterProtocol Methods

  func updateCurrentStepsInfo(currentSteps: [String: Int]) {
    self.currentSteps = currentSteps
  }
  
  func updateExerciseLists(exerciseList: [Movement]) {
    arrayTrainings = exerciseList
  }
  
  func updateTodaysTraining(todaysTraining: [Movement]) {
    self.todaysTraining = todaysTraining
  }
  
  func reloadExercises() {
    self.tableExercises.reloadData()
  }

  func showNoTrainingSelectedAlert() {
    let alertController = UIAlertController(title: "No training selected", message: "You need to select a training first", preferredStyle: .Alert)

    let okAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
    }
    alertController.addAction(okAction)
    
    let scheduleAction = UIAlertAction(title: "Select Training", style: .Default){ (action) in
      self.presenter!.navigateToView(LeftMenu.Schedule)
    }
    alertController.addAction(scheduleAction)
    
    self.presentViewController(alertController, animated: true) {
    }
  }
  
  //MARK: - TrainingViewCellDelegate Methods
  
  func cellHeaderTapped(tagSelected: Int) {
    if indexSelected == tagSelected {
      indexSelected = -1
    }else {
      indexSelected = tagSelected
    }
    tableExercises.reloadRowsAtIndexPaths([NSIndexPath(forItem: tagSelected, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Automatic)

    tableExercises.beginUpdates()
    tableExercises.endUpdates()

    tableExercises.scrollToRowAtIndexPath(NSIndexPath(forRow: tagSelected, inSection: 0), atScrollPosition: .Top, animated: true)
  }
  
}
