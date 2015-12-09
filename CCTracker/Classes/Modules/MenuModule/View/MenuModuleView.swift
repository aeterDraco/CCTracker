//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

protocol LeftMenuProtocol : class {
  func changeViewController(menu: LeftMenu)
}

class MenuModuleView: UIViewController, MenuModuleViewProtocol, LeftMenuProtocol
{
    var presenter: MenuModulePresenterProtocol?
    var homeViewController: UIViewController!
//    var scheduleViewController: UIViewController!
//    var exerciseViewController: UIViewController!
//    var progressionViewController: UIViewController!
//    var settingsViewController: UIViewController!

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.tableFooterView = UIView()
    
    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let homeViewController = storyboard.instantiateViewControllerWithIdentifier (ViewId.Home) as! HomeView
////    homeViewController.delegate = self
//    self.homeViewController = UINavigationController(rootViewController: homeViewController)
//    self.homeViewController.navigationController?.navigationBarHidden = true
//    
//    let scheduleViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Schedule) as! ScheduleViewController
//    self.scheduleViewController = UINavigationController(rootViewController: scheduleViewController)
//    self.scheduleViewController.navigationController?.navigationBarHidden = true
//    
//    let exerciseViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Exercise) as! ExerciseViewController
//    self.exerciseViewController = UINavigationController(rootViewController: exerciseViewController)
//    self.exerciseViewController.navigationController?.navigationBarHidden = true
//    
//    let progressionViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Progression) as! ProgressionViewController
//    self.progressionViewController = UINavigationController(rootViewController: progressionViewController)
//    self.progressionViewController.navigationController?.navigationBarHidden = true
//    
//    let settingsViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Settings) as! SettingsViewController
//    self.settingsViewController = UINavigationController(rootViewController: settingsViewController)
//    self.settingsViewController.navigationController?.navigationBarHidden = true
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter!.numberOfMenuItems()
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: NSStringFromClass(UITableViewCell))
    cell.textLabel?.font = UIFont (name: Defaults.appFont , size: 25.0)
    cell.textLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.67)
    cell.textLabel?.text = presenter!.getMenuItem(indexPath.row)
    cell.backgroundColor = UIColor.clearColor()
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    let men = self.getLeftMenuId(indexPath.item)
    let menu = LeftMenu(rawValue: indexPath.item)
    self.changeViewController(menu!)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  func changeViewController(menu: LeftMenu) {
//    self.presenter!.changeViewController(menu, slideMenu: self.slideMenuController()!)
//    let menuId = self.convertViewIdToMenu(menu)
    let newViewController = AppRouter.sharedInstance.fetchViewControllerWithDelegate(menu, leftMenuProtocol: self)
    self.slideMenuController()?.changeMainViewController(newViewController, close: true)
  }
  
  func convertViewIdToMenu(menu: String) -> LeftMenu {
    if menu == ViewId.Home {
      return LeftMenu.Home
    }else if menu == ViewId.Schedule {
      return LeftMenu.Schedule
    }else if menu == ViewId.Exercise {
      return LeftMenu.Exercise
    }else if menu == ViewId.Progression {
      return LeftMenu.Progression
    }else if menu == ViewId.Settings {
      return LeftMenu.Settings
    }
    return LeftMenu.Home
  }

//  func getLeftMenuId(indexPath: Int) -> String {
//    switch (indexPath) {
//    case LeftMenu.Home.rawValue:
//      return LeftMenu.Home
//    case LeftMenu.Schedule.rawValue:
//      return LeftMenu.Schedule
//    case LeftMenu.Exercise.rawValue:
//      return LeftMenu.Exercise
//    case LeftMenu.Progression.rawValue:
//      return LeftMenu.Progression
//    case LeftMenu.Settings.rawValue:
//      return LeftMenu.Settings
//    }
//  }
  
}