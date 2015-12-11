//
//  ScheduleViewController.swift
//  CCTracker
//
//  Created by Ricardo on 9/30/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController:UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate {

  let arrayWorkouts = [Workouts.NewBlood, Workouts.GoodBehavior, Workouts.Veterano, Workouts.Solitary, Workouts.Supermax]
  let training = Training()
  let reuseIdentifier = "Cell"
  private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
  private var scheduleCellSize:CGSize?
  
  var currentWorkout  = [String:[Movement]]()
  var selectedWorkout = Set<Int>()
  var selectedProgram = -1
  
  @IBOutlet weak var cellSize: UIView!
  @IBOutlet weak var btnCheckWorkout: UIButton!
  @IBOutlet weak var btnMenu: UIButton!
  @IBOutlet weak var pickerWorkouts: UIPickerView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var lblSelectedWorkout: UILabel!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu .addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.view.layoutIfNeeded()

    self.navigationController?.navigationBarHidden = true
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = sectionInsets
    layout.itemSize = CGSize(width: collectionView.frame.size.width/7, height: collectionView.frame.size.height/6)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    
    collectionView.collectionViewLayout = layout
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
//    loadTraining()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scheduleCellSize = CGSize(width: collectionView.frame.size.width/7, height: collectionView.frame.size.height/6)
    collectionView.reloadData()
  }
  
  
  //MARK: - Methods
  
//  func loadTraining(){
//    currentWorkout = training.getWorkoutSchedule()
//    if currentWorkout.count > 0 {
//      setPreMadeWorkoutName()
//      showWorkout(currentWorkout)
//    } else {
//        lblSelectedWorkout.text = ""
//    }
//  }
//  
//  func setPreMadeWorkoutName() {
//    lblSelectedWorkout.text = training.getWorkoutName()
//    lblSelectedWorkout.hidden = false
//
//    for name in arrayWorkouts {
//      if name == lblSelectedWorkout.text {
//        selectedProgram = arrayWorkouts.indexOf(name)!
//        pickerWorkouts.selectRow(selectedProgram, inComponent: 0, animated: true)
//        btnCheckWorkout.selected = true
//      }
//    }
//  }

//  func showWorkout(workout:[String:[Movement]]) {
//    for key in workout.keys {
//      let baseIndex = indexForDay(key)
//      for movement in workout[key]!{
//        let movIndex = indexForMovement(movement)
//        if  movIndex >= 0 {
//          selectedWorkout.insert(baseIndex+movIndex)
//        }
//      }
//    }
//    print("\(selectedWorkout)")
//    collectionView.reloadData()
//  }
//
//  func clearWorkout(workout:[String:[Movement]]) {
//    for key in workout.keys {
//      let baseIndex = indexForDay(key)
//      for movement in workout[key]!{
//        let movIndex = indexForMovement(movement)
//        if  movIndex >= 0 {
//          selectedWorkout.remove(baseIndex+movIndex)
//        }
//      }
//    }
//    collectionView.reloadData()
//  }

//  func indexForDay(selectedDay:String) ->Int {
//    if selectedDay == Days.Monday {
//      return 0
//    }else if selectedDay == Days.Tuesday {
//      return 1
//    }else if selectedDay == Days.Wednesday {
//      return 2
//    }else if selectedDay == Days.Thursday {
//      return 3
//    }else if selectedDay == Days.Friday {
//      return 4
//    }else if selectedDay == Days.Saturday {
//      return 5
//    }else {
//      return 6
//    }
//  }
  
  func indexForMovement(excersise:Movement) ->Int {
    if excersise is Pushup  {
      return 7*0
    }else if excersise is Squat {
      return 7*1
    }else if excersise is Pullup {
      return 7*2
    }else if excersise is LegRaise {
      return 7*3
    }else if excersise is Bridge {
      return 7*4
    }else if excersise is Handstand{
      return 7*5
    }else {
      return -1
    }
  }
  
  //MARK: - UICollection Delegate
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 42
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ScheduleCell
    cell.imgCheckbox.tag = indexPath.row
    cell.backgroundColor = checkIndexForColor(indexPath.row)
    
    if selectedWorkout.contains(indexPath.row) {
      cell.imgCheckbox.highlighted = true
    }else {
      cell.imgCheckbox.highlighted = false
    }
    
    return cell
  }
  
  func checkIndexForColor(row:Int) ->UIColor {
    switch row {
      case 0...6, 14...20, 28...34:
        return UIColor.clearColor()
    default:
        return UIColor(red: 231/255.0, green: 169/255.0, blue: 34/255.0, alpha: 1.0)
    }
  }
  
  func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
      print("collectionsizeforItem: \(CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height))")
      return scheduleCellSize!//CGSize(width: collectionView.frame.size.width/7, height: collectionView.frame.size.height/6)
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ScheduleCell
    if selectedWorkout.contains(indexPath.row) {
      selectedWorkout.remove(indexPath.row)
      cell.imgCheckbox.highlighted = false
    } else {
      selectedWorkout.insert(indexPath.row)
      print("\(cell.imgCheckbox.tag)")
    }
  }
  
  func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
    let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ScheduleCell
    if selectedWorkout.contains(indexPath.row) {
      cell.imgCheckbox.highlighted = true
    } else {
      cell.imgCheckbox.highlighted = false
    }
  }
   
  //MARK: - IBAction Methods
  
  @IBAction func selectDay(sender: UIButton) {
    print(sender.tag)
    sender.selected = !sender.selected
  }

  @IBAction func clearSchedule(sender: AnyObject) {
    selectedProgram = -1
    btnCheckWorkout.selected = false
    lblSelectedWorkout.hidden = true
    selectedWorkout = Set<Int>()
    collectionView.reloadData()
  }

  @IBAction func checkWorkout(sender: AnyObject) {
    btnCheckWorkout.selected = !btnCheckWorkout.selected
    
    if btnCheckWorkout.selected {
      if selectedProgram != -1{
//        clearWorkout(training.convictWorkout(workoutName: arrayWorkouts[selectedProgram]))
      }
//      selectedProgram = pickerWorkouts.selectedRowInComponent(0)
//      showWorkout(training.convictWorkout(workoutName: arrayWorkouts[selectedProgram]))
//      lblSelectedWorkout.hidden = false
//      lblSelectedWorkout.text = arrayWorkouts[selectedProgram]
    }else {
//      clearWorkout(training.convictWorkout(workoutName: arrayWorkouts[pickerWorkouts.selectedRowInComponent(0)]))
//      lblSelectedWorkout.hidden = true
//      selectedProgram = -1
   }
  }

  @IBAction func selectTraining(sender: AnyObject) {
//    currentWorkout = training.createWorkoutWithSet(selectedWorkout)
//    print("\(currentWorkout)")
//    let actionSheetController: UIAlertController
//    if training.saveWorkout(currentWorkout, workoutName: lblSelectedWorkout.text!) {
//      actionSheetController = UIAlertController(title:nil, message: "Traning schedule saved!", preferredStyle: .Alert)
//    }else {
//      actionSheetController = UIAlertController(title:nil, message: "Traning schedule could not be saved!", preferredStyle: .Alert)
//    }
//    
//    let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
//      //Do some stuff
//    }
//    actionSheetController.addAction(cancelAction)
//    self.presentViewController(actionSheetController, animated: true, completion: nil)
  }

  //MARK: - UIPicker Delegate Methods
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return arrayWorkouts.count
  }
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
  {
    let pickerLabel = UILabel()
    pickerLabel.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    pickerLabel.text = arrayWorkouts[row]
    pickerLabel.font = UIFont(name: Defaults.appFont, size: 15)
    pickerLabel.textAlignment = NSTextAlignment.Center
    return pickerLabel
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return arrayWorkouts[row]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if row == selectedProgram {
      btnCheckWorkout.selected = true
    }else {
      btnCheckWorkout.selected = false
    }
  }

}