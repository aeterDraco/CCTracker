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
    
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepOne,   step: Steps.stepOne,   progressionGoals: HandstandGoal.stepOne,   videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepTwo,   step: Steps.stepTwo,   progressionGoals: HandstandGoal.stepTwo,   videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepThree, step: Steps.stepThree, progressionGoals: HandstandGoal.stepThree, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepFour,  step: Steps.stepFour,  progressionGoals: HandstandGoal.stepFour,  videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepFive,  step: Steps.stepFive,  progressionGoals: HandstandGoal.stepFive,  videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepSix,   step: Steps.stepSix,   progressionGoals: HandstandGoal.stepSix,   videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepSeven, step: Steps.stepSeven, progressionGoals: HandstandGoal.stepSeven, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepEight, step: Steps.stepEight, progressionGoals: HandstandGoal.stepEight, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepNine,  step: Steps.stepNine,  progressionGoals: HandstandGoal.stepNine,  videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: HandstandSteps.stepTen,   step: Steps.stepTen,   progressionGoals: HandstandGoal.stepTen,   videoAddress: "", imgDescriptions: []))
  }
  
}