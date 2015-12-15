//
//  Pullup.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Pullup: Movement {
  
  init() {
    super.init(movementName: Movements.Pullup, movementIcon: Icons.whitePullup, currentStep: userWorkout.getCurrentStepforMovement(Movements.Pullup))
    
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepOne,   step: Steps.stepOne,   progressionGoals: PullupsGoal.stepOne,   videoAddress: "", imgDescriptions: ["pullups_01"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepTwo,   step: Steps.stepTwo,   progressionGoals: PullupsGoal.stepTwo,   videoAddress: "", imgDescriptions: ["pullups_02"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepThree, step: Steps.stepThree, progressionGoals: PullupsGoal.stepThree, videoAddress: "", imgDescriptions: ["pullups_03"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepFour,  step: Steps.stepFour,  progressionGoals: PullupsGoal.stepFour,  videoAddress: "", imgDescriptions: ["pullups_04"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepFive,  step: Steps.stepFive,  progressionGoals: PullupsGoal.stepFive,  videoAddress: "", imgDescriptions: ["pullups_05"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepSix,   step: Steps.stepSix,   progressionGoals: PullupsGoal.stepSix,   videoAddress: "", imgDescriptions: ["pullups_06"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepSeven, step: Steps.stepSeven, progressionGoals: PullupsGoal.stepSeven, videoAddress: "", imgDescriptions: ["pullups_07"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepEight, step: Steps.stepEight, progressionGoals: PullupsGoal.stepEight, videoAddress: "", imgDescriptions: ["pullups_08"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepNine,  step: Steps.stepNine,  progressionGoals: PullupsGoal.stepNine,  videoAddress: "", imgDescriptions: ["pullups_09"]))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepTen,   step: Steps.stepTen,   progressionGoals: PullupsGoal.stepTen,   videoAddress: "", imgDescriptions: ["pullups_10"]))
  }
  
}