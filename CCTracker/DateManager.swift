//
//  DateManager.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 25/11/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

enum Days: Int {
  case Sunday = 1
  case Monday
  case Tuesday
  case Wednesday
  case Thursday
  case Friday
  case Saturday
}

class DateManager {

  static func obtainTodaysWeekDay() -> Days {
    let todayDate = NSDate()
    let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    let myComponents = myCalendar.components(.Weekday, fromDate: todayDate)
    return DateManager.obtainDayName(weekDayInt: myComponents.weekday)
  }
  
  static func obtainDayName(weekDayInt weekDay:Int) -> Days{
    let weekDayName: Days
    switch(weekDay) {
      case Days.Sunday.rawValue:
        weekDayName = Days.Sunday
      case Days.Monday.rawValue:
        weekDayName = Days.Monday
      case Days.Tuesday.rawValue:
        weekDayName = Days.Tuesday
      case Days.Wednesday.rawValue:
        weekDayName = Days.Wednesday
      case Days.Thursday.rawValue:
        weekDayName = Days.Thursday
      case Days.Friday.rawValue:
        weekDayName = Days.Friday
      case Days.Saturday.rawValue:
        weekDayName = Days.Saturday
      default:
        weekDayName = Days.init(rawValue: 0)!
    }
    return weekDayName
  }

}
