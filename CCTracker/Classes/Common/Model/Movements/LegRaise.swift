//
//  LegRaise.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class LegRaise: Movement {
  
  init() {
    super.init(movementName: Movements.LegRaise, movementIcon: Icons.whiteLegRaise, currentStep: userWorkout.getCurrentStepforMovement(Movements.LegRaise))
    
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepOne,   step: Steps.stepOne,   progressionGoals: LegRaiseGoal.stepOne,   videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepTwo,   step: Steps.stepTwo,   progressionGoals: LegRaiseGoal.stepTwo,   videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepThree, step: Steps.stepThree, progressionGoals: LegRaiseGoal.stepThree, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepFour,  step: Steps.stepFour,  progressionGoals: LegRaiseGoal.stepFour,  videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepFive,  step: Steps.stepFive,  progressionGoals: LegRaiseGoal.stepFive,  videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepSix,   step: Steps.stepSix,   progressionGoals: LegRaiseGoal.stepSix,   videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepSeven, step: Steps.stepSeven, progressionGoals: LegRaiseGoal.stepSeven, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepEight, step: Steps.stepEight, progressionGoals: LegRaiseGoal.stepEight, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepNine,  step: Steps.stepNine,  progressionGoals: LegRaiseGoal.stepNine,  videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepTen,   step: Steps.stepTen,   progressionGoals: LegRaiseGoal.stepTen,   videoAddress: "", imgDescriptions: []))
  }
  
}