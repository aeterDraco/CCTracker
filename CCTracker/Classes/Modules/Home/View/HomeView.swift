//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController, HomeViewProtocol
{
  var presenter: HomePresenterProtocol?
  let reuseCellIdentifier = "HomeDisplayCell"
  var todaysTraining = [Movement] ()

  weak var delegate: LeftMenuProtocol?
  
  @IBOutlet weak var lblNoTraining: UILabel!
  @IBOutlet weak var tableTraining: UITableView!
  @IBOutlet weak var btnStartTraining: UIButton!
  @IBOutlet weak var btnSelectTraining: UIButton!
  @IBOutlet weak var btnMenu: UIButton!

  static func instantiate() -> UIViewController{
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")// as! HomeView
    return homeViewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu.addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
//    tableTraining.tableFooterView = UIView()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBarHidden = true
    
    self.presenter?.updateView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  //MARK: - Table View Data Source Delegate
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todaysTraining.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath) as! HomeDisplayCell
    let currentMovement = todaysTraining[indexPath.row]
    
    return configureCell(cellToConfigure: cell, withMovement: currentMovement)
  }
  
  func configureCell(cellToConfigure cell:HomeDisplayCell, withMovement movement:Movement) -> HomeDisplayCell{
    cell.backgroundColor = UIColor.clearColor()
    cell.imgExercise?.image = movement.iconMovement
    cell.lblExerciseName?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    cell.lblExerciseName?.font = UIFont(name: Defaults.appFont, size: 15)
    
    if movement.name == Movements.Rest {
      cell.lblExerciseName?.text = String(format: "%@", movement.name)
    }else {
      let stepInfo = movement.getStepInfo()
      cell.lblExerciseName?.text = String(format: "%@: %@", stepInfo[0],stepInfo[1])
    }
    return cell
  }
  
  //MARK: - IBActions Methods
  @IBAction func selectTraining(sender: AnyObject) {
    self.presenter!.navigateToView(LeftMenu.Schedule)
//    delegate?.changeViewController(LeftMenu.Schedule)
  }
  
  @IBAction func startTraining(sender: AnyObject) {
//    delegate?.changeViewController(LeftMenu.Exercise)
  }
  

  //MARK: - HomeViewProtocol Methods
  
  func displayTrainingInfo(todaysTraining: [Movement]) {
    self.todaysTraining = todaysTraining
    self.tableTraining.reloadData()
  }
  
  func noWorkoutSelected() {
    self.tableTraining.hidden     = true
    self.lblNoTraining.hidden     = false
    self.btnStartTraining.hidden  = true
    self.btnSelectTraining.hidden = false
  }

  
}