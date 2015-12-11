//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class ScheduleView: UIViewController, ScheduleViewProtocol, UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate {

  var presenter: SchedulePresenterProtocol?
  
  let reuseIdentifier = "Cell"
  private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
  private var scheduleCellSize:CGSize?
  
  var currentWorkout  = [Days:[Movement]]()
  var selectedWorkout = Set<Int>()
  var selectedProgram = -1
  var arrayWorkouts   = [String]()
  var isCCWorkout     = false
  
  weak var delegate: LeftMenuProtocol?
  
  @IBOutlet weak var cellSize: UIView!
  @IBOutlet weak var btnCheckWorkout: UIButton!
  @IBOutlet weak var btnMenu: UIButton!
  @IBOutlet weak var pickerWorkouts: UIPickerView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var lblSelectedWorkout: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu .addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    self.presenter?.updateView()
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
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scheduleCellSize = CGSize(width: collectionView.frame.size.width/7, height: collectionView.frame.size.height/6)
    collectionView.reloadData()
  }
  
  //MARK: - ScheduleViewProtocol Methods
  
  func clearScheduleView(completionHandler: CompletionHandlerType) {
    selectedProgram = -1
    btnCheckWorkout.selected = false
    lblSelectedWorkout.text = ""
    selectedWorkout = Set<Int>()
    collectionView.reloadData()
    
    completionHandler(Result.Success(true))
  }
  
  func updateCCWorkoutsPicker(workoutNames: [String]) {
    self.arrayWorkouts = workoutNames
    self.pickerWorkouts.reloadAllComponents()
  }
  
  func updateScheduleView(currentWorkoutSchedule: [Days: [Movement]]) {
    currentWorkout = currentWorkoutSchedule
    showWorkout(currentWorkout)
  }
  
  func updateWorkoutName(currentWorkoutName: String) {
    print("newName: \(currentWorkoutName)")
    lblSelectedWorkout.text = currentWorkoutName
  }
  
  func updateCCWorkoutSelected(isCCWorkout: Bool) {
    if isCCWorkout {
      selectedProgram = arrayWorkouts.indexOf(lblSelectedWorkout.text!)!
      pickerWorkouts.selectRow(selectedProgram, inComponent: 0, animated: true)
      btnCheckWorkout.selected = true
    }
    self.isCCWorkout = isCCWorkout
  }
  
  func displayFailureSavingWorkout(){
    displaySavingWorkoutActionSheet("", message: "Traning schedule could not be saved!")
  }
  
  func displaySuccessSavingWorkout(){
    displaySavingWorkoutActionSheet("", message: "Traning schedule saved!")
  }
  
  //MARK: - ActionSheet Methods
  
  func displaySavingWorkoutActionSheet(title: String, message: String) {
    let actionSheetController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    
    let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
    }
    actionSheetController.addAction(cancelAction)

    self.presentViewController(actionSheetController, animated: true, completion: nil)
  }


  //MARK: - IBAction Methods
  
  @IBAction func checkWorkoutAction(sender: UIButton) {
    print("checkWoerkout \(btnCheckWorkout.selected)")
    if btnCheckWorkout.selected {
      self.clearScheduleView() { (result) -> Void in
      }
    } else {
      let selectedWorkoutName = self.arrayWorkouts[self.pickerWorkouts.selectedRowInComponent(0)]
      self.presenter!.fetchCCWorkoutWithName(selectedWorkoutName)
    }
  }
  
  @IBAction func selectDayAction(sender: UIButton) {
    print(sender.tag)
    sender.selected = !sender.selected
  }
  
  @IBAction func clearScheduleAction(sender: AnyObject) {
    self.clearScheduleView() { (result) -> Void in
    }
  }
  
  @IBAction func selectTrainingAction(sender: AnyObject) {
    self.presenter!.saveWorkout(selectedWorkout, workoutName: lblSelectedWorkout.text!, isCCWorkout: isCCWorkout)
  }

  
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  func showWorkout(workout:[Days:[Movement]]) {
    for dayKey in workout.keys {
      var baseIndex = dayKey.rawValue
      
      switch (baseIndex) {
        case 2:
          baseIndex = 0
        default:
          baseIndex -= 2
      }
      
      for movement in workout[dayKey]!{
        let movIndex = indexForMovement(movement)
        if  movIndex >= 0 {
          selectedWorkout.insert(baseIndex+movIndex)
        }
      }
    }
    print("\(selectedWorkout)")
    collectionView.reloadData()
  }

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
//      print("\(cell.imgCheckbox.tag)")
    }
    print("didSelectItemAtIndexPath -> \(cell.imgCheckbox.tag) -> \(cell.selected)")
  }
  
  func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
    let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ScheduleCell
    if selectedWorkout.contains(indexPath.row) {
      cell.imgCheckbox.highlighted = true
    } else {
      cell.imgCheckbox.highlighted = false
    }
    print("didDeselectItemAtIndexPath -> \(cell.imgCheckbox.tag) -> \(selectedWorkout.contains(indexPath.row))")
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