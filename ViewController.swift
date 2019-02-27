//
//  ViewController.swift
//  BullsEye
//  Class: CS 330
//  Created by Jeffrey Trotz on 1/14/19.
//  Copyright © 2019 Jeffrey Trotz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Intitialize variable to hold values of the slider,
    // the target value, player's score, and the round
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    // Outlets for the slider and target value
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.startNewGame()
        
        // Slider button normal
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        // Slider button when pressed
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        // Left track of the slider
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        // Right track of the slider
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert()
    {
        // Calculate the player's score
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        let title: String
        
        // If the difference is 0 set the alert box
        // title and give the player an exta 100 points
        if difference == 0
        {
            title = "Perfect!"
            points += 100
        }
        
        // If the difference is less than 5 set the alert
        // box title and give the player an extra 50 points
        else if difference < 5
        {
            title = "You almost had it!"
            points += 50
        }
        
        // If the difference is less than 10 set the alert
        // box title, but not extra points
        else if difference < 10
        {
            title = "Pretty good!"
        }
            
        // Default case
        else
        {
            title = "Note even close..."
        }
        
        // Calculate the score
        score += points
        
        // Set the message show in the alert box
        let message = "You scored \(points) points"
        
        // Set alert box title and other details
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Set alert box button text and other details
        let action = UIAlertAction(title: "OK", style: .default, handler: {_ in self.startNewRound()})
        
        // Add the action to the alert
        alert.addAction(action)
        
        // Show the alert box
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        // Gets the slider value
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame()
    {
        // Reset score/round
        score = 0
        round = 0
        
        // Call startNewRound() to reset the rest
        startNewRound()
        
        // Animates items when they're reset
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func startNewRound()
    {
        // Add one to the current round number
        round += 1
        
        // Generate and store a random number between 1 and 100 (inclusive)
        targetValue = Int.random(in: 1...100)
        
        // Reset current slider value
        currentValue = 50
        
        // Set the slider to the reset value
        slider.value = Float(currentValue)
        
        // Update the labels
        self.updateLabels()
    }
    
    func updateLabels()
    {
        // Update labels
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
