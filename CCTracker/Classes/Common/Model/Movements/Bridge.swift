//
//  Bridge.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Bridge: Movement {
  
  init() {
    super.init(movementName: Movements.Bridge, movementIcon: Icons.whiteBridge, currentStep: userWorkout.getCurrentStepforMovement(Movements.Bridge))
    
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepOne,   step: Steps.stepOne,   progressionGoals: BridgeGoal.stepOne,   videoAddress: "", imgDescriptions: ["bridges_01"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepTwo,   step: Steps.stepTwo,   progressionGoals: BridgeGoal.stepTwo,   videoAddress: "", imgDescriptions: ["bridges_02"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepThree, step: Steps.stepThree, progressionGoals: BridgeGoal.stepThree, videoAddress: "", imgDescriptions: ["bridges_03"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepFour,  step: Steps.stepFour,  progressionGoals: BridgeGoal.stepFour,  videoAddress: "", imgDescriptions: ["bridges_04"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepFive,  step: Steps.stepFive,  progressionGoals: BridgeGoal.stepFive,  videoAddress: "", imgDescriptions: ["bridges_05"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepSix,   step: Steps.stepSix,   progressionGoals: BridgeGoal.stepSix,   videoAddress: "", imgDescriptions: ["bridges_06"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepSeven, step: Steps.stepSeven, progressionGoals: BridgeGoal.stepSeven, videoAddress: "", imgDescriptions: ["bridges_07"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepEight, step: Steps.stepEight, progressionGoals: BridgeGoal.stepEight, videoAddress: "", imgDescriptions: ["bridges_08"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepNine,  step: Steps.stepNine,  progressionGoals: BridgeGoal.stepNine,  videoAddress: "", imgDescriptions: ["bridges_09"], trainingStandard: TrainingStandards.beginner))
    self.exercises.append(Exercise(exerciseName: BridgeSteps.stepTen,   step: Steps.stepTen,   progressionGoals: BridgeGoal.stepTen,   videoAddress: "", imgDescriptions: ["bridges_10"], trainingStandard: TrainingStandards.beginner))
  }
  
}