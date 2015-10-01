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
  
  let training = Training()
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
  
  func loadTraining(){
    todaysTraining = training.readTodaysTraining()
    if todaysTraining.count > 0 {
      btnStartTraining.hidden  = false
      btnSelectTraining.hidden = true

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
    
    cell.imgExercise?.image = currentMovement.iconMovement
    cell.lblExerciseName?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    cell.lblExerciseName?.font = UIFont(name: Defaults.appFont, size: 15)
    
    if currentMovement.name == Movements.Rest {
      cell.lblExerciseName?.text = String(format: "%@", currentMovement.name)
    }else {
      cell.lblExerciseName?.text = String(format: "%@: %@", "Step Seven", currentMovement.name)
    }
    
    
    print("\(cell.lblExerciseName?.text)")
    return cell
  }
  
  @IBAction func selectTraining(sender: AnyObject) {
    delegate?.changeViewController(LeftMenu.Schedule)
  }
}