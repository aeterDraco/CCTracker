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
    
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepOne, step: Steps.stepOne, progressionGoals: PullupsGoal.stepOne, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepTwo, step: Steps.stepTwo, progressionGoals: PullupsGoal.stepTwo, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepThree, step: Steps.stepThree, progressionGoals: PullupsGoal.stepThree, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepFour, step: Steps.stepFour, progressionGoals: PullupsGoal.stepFour, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepFive, step: Steps.stepFive, progressionGoals: PullupsGoal.stepFive, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepSix, step: Steps.stepSix, progressionGoals: PullupsGoal.stepSix, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepSeven, step: Steps.stepSeven, progressionGoals: PullupsGoal.stepSeven, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepEight, step: Steps.stepEight, progressionGoals: PullupsGoal.stepEight, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepNine, step: Steps.stepNine, progressionGoals: PullupsGoal.stepNine, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PullupsSteps.stepTen, step: Steps.stepTen, progressionGoals: PullupsGoal.stepTen, videoAddress: "", imgDescriptions: []))
  }
  
}