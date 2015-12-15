//
//  Handstand.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Handstand: Movement {
  
  init() {
    super.init(movementName: Movements.Handstand, movementIcon: Icons.whiteHandstand, currentStep: userWorkout.getCurrentStepforMovement(Movements.Handstand))
    
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepOne,   step: Steps.stepOne,   progressionGoals: HandstandGoal.stepOne,   videoAddress: "", imgDescriptions: ["handstandPushups_01"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepTwo,   step: Steps.stepTwo,   progressionGoals: HandstandGoal.stepTwo,   videoAddress: "", imgDescriptions: ["handstandPushups_02"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepThree, step: Steps.stepThree, progressionGoals: HandstandGoal.stepThree, videoAddress: "", imgDescriptions: ["handstandPushups_03"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepFour,  step: Steps.stepFour,  progressionGoals: HandstandGoal.stepFour,  videoAddress: "", imgDescriptions: ["handstandPushups_04"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepFive,  step: Steps.stepFive,  progressionGoals: HandstandGoal.stepFive,  videoAddress: "", imgDescriptions: ["handstandPushups_05"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepSix,   step: Steps.stepSix,   progressionGoals: HandstandGoal.stepSix,   videoAddress: "", imgDescriptions: ["handstandPushups_06"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepSeven, step: Steps.stepSeven, progressionGoals: HandstandGoal.stepSeven, videoAddress: "", imgDescriptions: ["handstandPushups_07"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepEight, step: Steps.stepEight, progressionGoals: HandstandGoal.stepEight, videoAddress: "", imgDescriptions: ["handstandPushups_08"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepNine,  step: Steps.stepNine,  progressionGoals: HandstandGoal.stepNine,  videoAddress: "", imgDescriptions: ["handstandPushups_09"]))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepTen,   step: Steps.stepTen,   progressionGoals: HandstandGoal.stepTen,   videoAddress: "", imgDescriptions: ["handstandPushups_10"]))
  }
  
}