//
//  MenuViewController.swift
//  CCTracker
//
//  Created by Ricardo on 9/30/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

enum LeftMenu: Int {
  case Home = 0
  case Schedule
  case Exercise
  case Progression
  case Settings
}


//protocol LeftMenuProtocol : class {
//  func changeViewController(menu: LeftMenu)
//}

class MenuViewController : UIViewController, LeftMenuProtocol {
  
  @IBOutlet weak var tableView: UITableView!

  var menus = ["Home", "Schedule", "Exercise", "Progression", "Settings"]

  var homeViewController: UIViewController!
  var scheduleViewController: UIViewController!
  var exerciseViewController: UIViewController!
  var progressionViewController: UIViewController!
  var settingsViewController: UIViewController!

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.tableFooterView = UIView()

    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let homeViewController = storyboard.instantiateViewControllerWithIdentifier (ViewId.Home) as! HomeView
//    homeViewController.delegate = self
    self.homeViewController = UINavigationController(rootViewController: homeViewController)
    self.homeViewController.navigationController?.navigationBarHidden = true
    
    let scheduleViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Schedule) as! ScheduleViewController
    self.scheduleViewController = UINavigationController(rootViewController: scheduleViewController)
    self.scheduleViewController.navigationController?.navigationBarHidden = true
    
    let exerciseViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Exercise) as! ExerciseViewController
    self.exerciseViewController = UINavigationController(rootViewController: exerciseViewController)
    self.exerciseViewController.navigationController?.navigationBarHidden = true

    let progressionViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Progression) as! ProgressionViewController
    self.progressionViewController = UINavigationController(rootViewController: progressionViewController)
    self.progressionViewController.navigationController?.navigationBarHidden = true

    let settingsViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Settings) as! SettingsViewController
    self.settingsViewController = UINavigationController(rootViewController: settingsViewController)
    self.settingsViewController.navigationController?.navigationBarHidden = true
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menus.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: NSStringFromClass(UITableViewCell))
    cell.textLabel?.font = UIFont (name: Defaults.appFont , size: 25.0)
    cell.textLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    cell.textLabel?.text = menus[indexPath.row]
    cell.backgroundColor = UIColor.clearColor()
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if let menu = LeftMenu(rawValue: indexPath.item) {
      self.changeViewController(menu)
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
  }
  
  func changeViewController(menu: String) {
    let menuValue = self.initLeftMenu(menu)
    switch menuValue {
      case LeftMenu.Home.rawValue:
        self.slideMenuController()?.changeMainViewController(self.homeViewController, close: true)
      case LeftMenu.Schedule.rawValue:
        self.slideMenuController()?.changeMainViewController(self.scheduleViewController, close: true)
      case LeftMenu.Exercise.rawValue:
        self.slideMenuController()?.changeMainViewController(self.exerciseViewController, close: true)
      case LeftMenu.Progression.rawValue:
        self.slideMenuController()?.changeMainViewController(self.progressionViewController, close: true)
      case LeftMenu.Settings.rawValue:
        self.slideMenuController()?.changeMainViewController(self.settingsViewController, close: true)
      default:
        break
    }
  }

  func changeViewController(menu: LeftMenu) {
    switch menu {
      case LeftMenu.Home:
        self.slideMenuController()?.changeMainViewController(self.homeViewController, close: true)
      case LeftMenu.Schedule:
        self.slideMenuController()?.changeMainViewController(self.scheduleViewController, close: true)
      case LeftMenu.Exercise:
        self.slideMenuController()?.changeMainViewController(self.exerciseViewController, close: true)
      case LeftMenu.Progression:
        self.slideMenuController()?.changeMainViewController(self.progressionViewController, close: true)
      case LeftMenu.Settings:
        self.slideMenuController()?.changeMainViewController(self.settingsViewController, close: true)
    }
  }
  
  func initLeftMenu(menu: String)->Int {
    if menu == String("\(LeftMenu.Home)") {
      return LeftMenu.Home.rawValue
    }else if menu == String("\(LeftMenu.Schedule)") {
      return LeftMenu.Schedule.rawValue
    }else if menu == String("\(LeftMenu.Exercise)") {
      return LeftMenu.Exercise.rawValue
    }else if menu == String("\(LeftMenu.Progression)") {
      return LeftMenu.Progression.rawValue
    }else{ // if menu == String("\(LeftMenu.Settings)")
      return LeftMenu.Settings.rawValue
    }
  }

}