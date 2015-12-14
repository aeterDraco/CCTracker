//
//  Constants.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

let userWorkout = UserWorkout()

typealias CompletionHandlerType = (Result) -> Void

enum Result {
  case Success(AnyObject?)
  case Failure(Error)
}

enum Error: ErrorType {
  case LocalDataManagerFailure
}

protocol ViewProtocol: class {
}

protocol MenuProtocol: class {
  weak var delegate: LeftMenuProtocol? { get set }
}

struct Notifications {
  static let HomeSelected = "HomeSelected"
  static let ScheduleSelected = "ScheduleSelected"
}


struct Defaults {
  static let schedule      = "kSchedule"
  static let workoutName   = "kWorkoutName"
  static let appFont       = "Futura-CondensedExtraBold"
  static let currentSteps  = "kCurrentSteps"
  static let isCCWorkout   = "kIsCCWorkout"
}

struct Icons {
  static let whiteRest      = "icon_resting_white"
  static let whitePushup    = "icon_pushUp_white"
  static let whiteSquat     = "icon_squat_white"
  static let whitePullup    = "icon_pullUp_white"
  static let whiteLegRaise  = "icon_legRaise_white"
  static let whiteBridge    = "icon_bridge_white"
  static let whiteHandstand = "icon_handstand_white"
}

struct Workouts {
  static let NewBlood     = "New Blood"
  static let GoodBehavior = "Good Behavior"
  static let Veterano     = "Veterano"
  static let Solitary     = "Solitary Confinement"
  static let Supermax     = "Supermax"
}

struct ViewId {
  static let Home        = "HomeViewController"
  static let Schedule    = "ScheduleViewController"
  static let Exercise    = "ExerciseViewController"
  static let Progression = "ProgressionViewController"
  static let Settings    = "SettingsViewController"
  static let Menu        = "MenuViewController"
  static let Container   = "MenuContainerViewController"
  
  static func fetchValue(intValue: Int) -> String {
    switch (intValue) {
      case 0:
        return ViewId.Home
      case 1:
        return ViewId.Schedule
      case 2:
        return ViewId.Exercise
      case 3:
        return ViewId.Progression
      case 4:
        return ViewId.Settings
      default:
        break
    }
    return String()
  }
}

struct TrainingStandards {
  static let beginner     = "Beginner"
  static let intermediate = "Intermediate"
  static let progression  = "Progression"
  static let elite        = "Elite"
}

struct Movements {
  static let Pushup    = "Pushup"
  static let Squat     = "Squat"
  static let Pullup    = "Pullup"
  static let LegRaise  = "Leg Raise"
  static let Bridge    = "Bridge"
  static let Handstand = "Handstand"
  static let Rest      = "Rest"
  
  static let AllMovements = [Movements.Pushup, Movements.Squat, Movements.Pullup, Movements.LegRaise, Bridge, Movements.Handstand]
}

struct Steps {
  static let stepOne   = 0
  static let stepTwo   = 1
  static let stepThree = 2
  static let stepFour  = 3
  static let stepFive  = 4
  static let stepSix   = 5
  static let stepSeven = 6
  static let stepEight = 7
  static let stepNine  = 8
  static let stepTen   = 9
}

let stepNames = ["Step One", "Step Two", "Step THree", "Step Four", "Step Five", "Step Six", "Step Seven", "Step Eight", "Step Nine", "Step Ten"]

//struct StepNames {
//  static let stepOne   = "Step One"
//  static let stepTwo   = "Step Two"
//  static let stepThree = "Step Three"
//  static let stepFour  = "Step Four"
//  static let stepFive  = "Step Five"
//  static let stepSix   = "Step Six"
//  static let stepSeven = "Step Seven"
//  static let stepEight = "Step Eight"
//  static let stepNine  = "Step Nine"
//  static let stepTen   = "Step Ten"
//}

struct Goals {
  var sets = 0
  var repetitions = 0
}

// MARK: Pushup Info

struct PushupSteps {
  static let stepOne   = "Wall Pushups"
  static let stepTwo   = "Invline Pushups"
  static let stepThree = "Kneeling Pushups"
  static let stepFour  = "Half Pushups"
  static let stepFive  = "Full Pushups"
  static let stepSix   = "Close Pushups"
  static let stepSeven = "Uneven Pushups"
  static let stepEight = "1/2 One-Arm Pushups"
  static let stepNine  = "Lever Pushups"
  static let stepTen   = "One-Arm Pushups"
}

struct PushupsGoal {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 25), TrainingStandards.progression : Goals(sets: 3, repetitions: 50)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 40)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 30)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 12), TrainingStandards.progression : Goals(sets: 3, repetitions: 25)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.elite : Goals(sets: 1, repetitions: 100)]
}

// MARK: Squats Info

struct SquatsSteps {
  static let stepOne   = "Shoulderstand Squats"
  static let stepTwo   = "Jackknife Squats"
  static let stepThree = "Supported Squats"
  static let stepFour  = "Half Squats"
  static let stepFive  = "Full Squats"
  static let stepSix   = "Close Squats"
  static let stepSeven = "Uneven Squats"
  static let stepEight = "1/2 One-Leg Squats"
  static let stepNine  = "Assisted One-Leg Squats"
  static let stepTen   = "One-Leg Squats"
}

struct SquatsGoal {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 25), TrainingStandards.progression : Goals(sets: 3, repetitions: 50)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 40)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 30)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 35), TrainingStandards.progression : Goals(sets: 2, repetitions: 50)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 30)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)] //on both legs
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)] //on both legs
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)] //on both legs
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.elite : Goals(sets: 2, repetitions: 50)] //on both legs
}

// MARK: Leg Raise Info

struct LegRaiseSteps {
  static let stepOne   = "Knee Tucks"
  static let stepTwo   = "Flat Knee Raises"
  static let stepThree = "Flat Bent Leg Raises"
  static let stepFour  = "Flat Frog Raises"
  static let stepFive  = "Flat Straight Leg Raises"
  static let stepSix   = "Hanging Knee Raises"
  static let stepSeven = "Hanging Bent Leg Raises"
  static let stepEight = "Hanging Frog Raises"
  static let stepNine  = "Partial Straight Leg Raises"
  static let stepTen   = "Hanging Straight Leg Raises"
}

struct LegRaiseGoal {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 25), TrainingStandards.progression : Goals(sets: 3, repetitions: 40)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 35)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 30)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 25)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.elite : Goals(sets: 2, repetitions: 30)]
}

// MARK: Bridge Info

struct BridgeSteps {
  static let stepOne   = "Short Bridge"
  static let stepTwo   = "Straight Bridge"
  static let stepThree = "Angled Bridge"
  static let stepFour  = "Head Bridges"
  static let stepFive  = "Half Bridges"
  static let stepSix   = "Full Bridges"
  static let stepSeven = "Wall Walking Bridges (Down)"
  static let stepEight = "Wall Walking Bridges (Up)"
  static let stepNine  = "Closing Bridges"
  static let stepTen   = "Stand-To-Stand Bridges"
}

struct BridgeGoal {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 25), TrainingStandards.progression : Goals(sets: 3, repetitions: 50)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 40)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 30)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 2, repetitions: 25)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 6), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 3), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 6), TrainingStandards.progression : Goals(sets: 2, repetitions: 10)]
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 2), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 4), TrainingStandards.progression : Goals(sets: 2, repetitions: 8)]
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 1), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 3), TrainingStandards.progression : Goals(sets: 2, repetitions: 6)]
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 1), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 3), TrainingStandards.elite : Goals(sets: 2, repetitions: 30)]
}

// MARK: Handstand Info

struct HandstandSteps {
  static let stepOne   = "Wall Headstands"
  static let stepTwo   = "Crow Stands"
  static let stepThree = "Wall Handstands"
  static let stepFour  = "Half Handstand Pushups"
  static let stepFive  = "Handstand Pushups"
  static let stepSix   = "Close Handstand Pushups"
  static let stepSeven = "Uneven Handstand Pushups"
  static let stepEight = "1/2 One-Arm Handstand Pushups"
  static let stepNine  = "Lever Handstand Pushups"
  static let stepTen   = "One-Arm Handstand Pushups"
}

struct HandstandGoal {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 30), TrainingStandards.intermediate : Goals(sets: 1, repetitions: 60), TrainingStandards.progression : Goals(sets: 1, repetitions: 120)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 1, repetitions: 30), TrainingStandards.progression : Goals(sets: 1, repetitions: 60)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 30), TrainingStandards.intermediate : Goals(sets: 1, repetitions: 60), TrainingStandards.progression : Goals(sets: 1, repetitions: 120)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 9), TrainingStandards.progression : Goals(sets: 2, repetitions: 12)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 8), TrainingStandards.progression : Goals(sets: 2, repetitions: 10)] //on both arms
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 4), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 6), TrainingStandards.progression : Goals(sets: 2, repetitions: 8)] //on both arms
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 3), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 4), TrainingStandards.progression : Goals(sets: 2, repetitions: 6)] //on both arms
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 1), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 2), TrainingStandards.elite : Goals(sets: 1, repetitions: 5)] //on both arms
}

// MARK: Pullups Info

struct PullupsSteps {
  static let stepOne   = "Vertical Pulls"
  static let stepTwo   = "Horizontal Pulls"
  static let stepThree = "Jackknife Pulls"
  static let stepFour  = "Half Pullups"
  static let stepFive  = "Full Pullups"
  static let stepSix   = "Close Pullups"
  static let stepSeven = "Uneven Pullups"
  static let stepEight = "1/2 One-Arm Pullups"
  static let stepNine  = "Assisted One-Arm Pullups"
  static let stepTen   = "One-Arm Pullups"
}

struct PullupsGoal {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 40)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 30)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 20)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 11), TrainingStandards.progression : Goals(sets: 2, repetitions: 15)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 8), TrainingStandards.progression : Goals(sets: 2, repetitions: 10)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 8), TrainingStandards.progression : Goals(sets: 2, repetitions: 10)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 7), TrainingStandards.progression : Goals(sets: 2, repetitions: 9)] //on both arms
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 4), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 6), TrainingStandards.progression : Goals(sets: 2, repetitions: 8)] //on both arms
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 3), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 5), TrainingStandards.progression : Goals(sets: 2, repetitions: 7)] //on both arms
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 1), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 3), TrainingStandards.elite : Goals(sets: 2, repetitions: 6)] //on both arms
}





struct TrainingGoals {
  static let stepOne : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 25), TrainingStandards.progression : Goals(sets: 3, repetitions: 50)]
  static let stepTwo : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 20), TrainingStandards.progression : Goals(sets: 3, repetitions: 40)]
  static let stepThree : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 10), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 15), TrainingStandards.progression : Goals(sets: 3, repetitions: 30)]
  static let stepFour : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 12), TrainingStandards.progression : Goals(sets: 3, repetitions: 25)]
  static let stepFive : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSix : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepSeven : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepEight : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepNine : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 20)]
  static let stepTen : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.elite : Goals(sets: 1, repetitions: 100)]
  
  static let stepFourSquat : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 8), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 35), TrainingStandards.progression : Goals(sets: 2, repetitions: 50)]
  static let stepFiveSquat : [String: Goals] = [TrainingStandards.beginner : Goals(sets: 1, repetitions: 5), TrainingStandards.intermediate : Goals(sets: 2, repetitions: 10), TrainingStandards.progression : Goals(sets: 2, repetitions: 30)]
}



