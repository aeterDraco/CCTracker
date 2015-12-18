//
//  Exercise.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Exercise {
  var step: Int
  var name: String
  var goals: [String : Goals]
  var proggresion: String
  var videoAddress: String
  var imgDescriptions: [String]
  
  init(exerciseName name:String, step:Int, progressionGoals goals:[String : Goals], videoAddress:String, imgDescriptions:[String], trainingStandard: String){
    self.name            = name
    self.step            = step
    self.goals           = goals
    self.videoAddress    = videoAddress
    self.imgDescriptions = imgDescriptions
    self.proggresion     = trainingStandard
  }
}