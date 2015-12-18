//
//  HomeViewController.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController  {
  
  var training = Training()
  let reuseCellIdentifier = "HomeDisplayCell"
  var todaysTraining = [Movement] ()
  weak var delegate: LeftMenuProtocol?

  
  @IBOutlet weak var lblNoTraining: UILabel!
  @IBOutlet weak var tableTraining: UITableView!
  @IBOutlet weak var btnStartTraining: UIButton!
  @IBOutlet weak var btnSelectTraining: UIButton!
  @IBOutlet weak var btnMenu: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu.addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
    tableTraining.tableFooterView = UIView()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBarHidden = true
    loadTraining()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: Methods
  
  func loadTraining(){
    training = Training()
//    todaysTraining = training.readTodaysTraining()
    if todaysTraining.count > 0 {
      btnStartTraining.hidden  = false
      btnSelectTraining.hidden = true
      lblNoTraining.hidden     = true
      tableTraining.hidden     = false

      tableTraining.reloadData()
    }else{
      lblNoTraining.hidden     = false
      tableTraining.hidden     = true
      btnStartTraining.hidden  = true
      btnSelectTraining.hidden = false
    }
  }
  
  //MARK: - Table View Data Source Delegate
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todaysTraining.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath) as! HomeDisplayCell
    cell.backgroundColor = UIColor.clearColor()
    let currentMovement = todaysTraining[indexPath.row]
    
    cell.imgExercise?.image = UIImage(named: currentMovement.iconMovement)
    cell.lblExerciseName?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    cell.lblExerciseName?.font = UIFont(name: Defaults.appFont, size: 15)
    
    if currentMovement.name == Movements.Rest {
      cell.lblExerciseName?.text = String(format: "%@", currentMovement.name)
    }else {
      let stepInfo = currentMovement.getStepInfo()
      cell.lblExerciseName?.text = String(format: "%@: %@", stepInfo[0],stepInfo[1])
    }
    
    print("\(cell.lblExerciseName?.text)")
    return cell
  }
  
  //MARK: - IBActions Methods
  @IBAction func selectTraining(sender: AnyObject) {
    delegate?.changeViewController(LeftMenu.Schedule)
  }

  @IBAction func StartTraining(sender: AnyObject) {
    delegate?.changeViewController(LeftMenu.Exercise)
  }
  
}