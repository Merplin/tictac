//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Merlin Zhao on 6/3/17.
//  Copyright © 2017 Merlin Zhao. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var drawGame = false
    
    let winCombo = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!


    
    @IBAction func action(_ sender: AnyObject)
    {
        restartButton.isHidden = false     //show restart button when playing
        drawGame = false
        
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winCombo
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                playAgainButton.isHidden = false
                restartButton.isHidden = true
                label.isHidden = false

                if gameState[combination[0]] == 1
                {
                    label.text = "Cross wins!"
                    label.textColor = UIColor.orange
                }
                if gameState[combination[0]] == 2
                {
                    label.text = "Circle wins!"
                    label.textColor = UIColor.blue
                }
                if gameIsActive == false
                {
                    label.text = "DRAW!"
                    label.textColor = UIColor.red
                    label.isHidden = false
                    playAgainButton.isHidden = false
                    restartButton.isHidden = true
                }
                
                
            }
        }
        gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false
        {
            label.text = "DRAW!"
            label.textColor = UIColor.red
            label.isHidden = false
            playAgainButton.isHidden = false
            restartButton.isHidden = true
        }
        
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    
    
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restartButton(_ sender: UIButton)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        restartButton.isHidden = false
        label.isHidden = true
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


