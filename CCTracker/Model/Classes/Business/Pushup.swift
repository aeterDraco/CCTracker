//
//  Pushup.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Pushup: Movement {
  
  init() {
    super.init(movementName: Movements.Pushup, movementIcon: Icons.whitePushup)

    self.exercises.append(Exercise(exerciseName: PushupSteps.stepOne, step: Steps.stepOne, progressionGoals: PushupsGoal.stepOne, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepTwo, step: Steps.stepTwo, progressionGoals: PushupsGoal.stepTwo, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepThree, step: Steps.stepThree, progressionGoals: PushupsGoal.stepThree, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepFour, step: Steps.stepFour, progressionGoals: PushupsGoal.stepFour, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepFive, step: Steps.stepFive, progressionGoals: PushupsGoal.stepFive, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepSix, step: Steps.stepSix, progressionGoals: PushupsGoal.stepSix, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepSeven, step: Steps.stepSeven, progressionGoals: PushupsGoal.stepSeven, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepEight, step: Steps.stepEight, progressionGoals: PushupsGoal.stepEight, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepNine, step: Steps.stepNine, progressionGoals: PushupsGoal.stepNine, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: PushupSteps.stepTen, step: Steps.stepTen, progressionGoals: PushupsGoal.stepTen, videoAddress: "", imgDescriptions: []))
  }
  
}