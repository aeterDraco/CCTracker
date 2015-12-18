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
    
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepOne,   step: Steps.stepOne,   progressionGoals: LegRaiseGoal.stepOne,   videoAddress: "", imgDescriptions: ["legRaises_01"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepTwo,   step: Steps.stepTwo,   progressionGoals: LegRaiseGoal.stepTwo,   videoAddress: "", imgDescriptions: ["legRaises_02"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepThree, step: Steps.stepThree, progressionGoals: LegRaiseGoal.stepThree, videoAddress: "", imgDescriptions: ["legRaises_03"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepFour,  step: Steps.stepFour,  progressionGoals: LegRaiseGoal.stepFour,  videoAddress: "", imgDescriptions: ["legRaises_04"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepFive,  step: Steps.stepFive,  progressionGoals: LegRaiseGoal.stepFive,  videoAddress: "", imgDescriptions: ["legRaises_05"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepSix,   step: Steps.stepSix,   progressionGoals: LegRaiseGoal.stepSix,   videoAddress: "", imgDescriptions: ["legRaises_06"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepSeven, step: Steps.stepSeven, progressionGoals: LegRaiseGoal.stepSeven, videoAddress: "", imgDescriptions: ["legRaises_07"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepEight, step: Steps.stepEight, progressionGoals: LegRaiseGoal.stepEight, videoAddress: "", imgDescriptions: ["legRaises_08"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepNine,  step: Steps.stepNine,  progressionGoals: LegRaiseGoal.stepNine,  videoAddress: "", imgDescriptions: ["legRaises_09"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: LegRaiseSteps.stepTen,   step: Steps.stepTen,   progressionGoals: LegRaiseGoal.stepTen,   videoAddress: "", imgDescriptions: ["legRaises_10"], trainingStandard: TrainingStandards.beginner))
  }
  
}