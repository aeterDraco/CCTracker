//
//  Squat.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Squat: Movement {
  
  init() {
    super.init(movementName: Movements.Squat, movementIcon: Icons.whiteSquat, currentStep: userWorkout.getCurrentStepforMovement(Movements.Squat))
    
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepOne, step: Steps.stepOne, progressionGoals: SquatsGoal.stepOne, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepTwo, step: Steps.stepTwo, progressionGoals: SquatsGoal.stepTwo, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepThree, step: Steps.stepThree, progressionGoals: SquatsGoal.stepThree, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepFour, step: Steps.stepFour, progressionGoals: SquatsGoal.stepFour, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepFive, step: Steps.stepFive, progressionGoals: SquatsGoal.stepFive, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepSix, step: Steps.stepSix, progressionGoals: SquatsGoal.stepSix, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepSeven, step: Steps.stepSeven, progressionGoals: SquatsGoal.stepSeven, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepEight, step: Steps.stepEight, progressionGoals: SquatsGoal.stepEight, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepNine, step: Steps.stepNine, progressionGoals: SquatsGoal.stepNine, videoAddress: "", imgDescriptions: []))
    self.exercises.append(Exercise(exerciseName: SquatsSteps.stepTen, step: Steps.stepTen, progressionGoals: SquatsGoal.stepTen, videoAddress: "", imgDescriptions: []))
  }
  
}