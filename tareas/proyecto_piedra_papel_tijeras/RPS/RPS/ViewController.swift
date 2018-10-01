//
//  ViewController.swift
//  RPS
//
//  Created by Usuario invitado on 19/9/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var userSign: Sign = .paper
    @IBOutlet weak var computerSignalOutlet: UILabel!
    @IBOutlet weak var gameStateOutlet: UILabel!
    @IBOutlet weak var rockSignalOutlet: UIButton!
    @IBOutlet weak var paperSignalOutlet: UIButton!
    @IBOutlet weak var scissorsSignalOutlet: UIButton!
    @IBOutlet weak var playAgainButtonOutlet: UIButton!
    @IBAction func rockSignalAction(_ sender: Any) {
        userSign = .rock
        play()
    }
    
    @IBAction func paperSignalAction(_ sender: Any) {
        userSign = .paper
        play()
    }
    
    @IBAction func scissorsSignalAction(_ sender: Any) {
        userSign = .scissors
        play()
    }
    
    @IBAction func playAgainButtonAction(_ sender: Any) {
        updateUI(oldUI: .start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(oldUI: .start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI(oldUI: GameState){
        
        gameStateOutlet.text = oldUI.textValue
        
        if(oldUI == .start){
            computerSignalOutlet.text = "👾"
            playAgainButtonOutlet.isHidden = true;
            rockSignalOutlet.isHidden = false;
            paperSignalOutlet.isHidden = false;
            scissorsSignalOutlet.isHidden = false;
            rockSignalOutlet.isEnabled = true;
            paperSignalOutlet.isEnabled = true;
            scissorsSignalOutlet.isEnabled = true;
            self.view.backgroundColor = UIColor.purple
        }
        else {
            
            if(oldUI == .win){
                self.view.backgroundColor = UIColor.green
            }
            else if(oldUI == .lose){
                self.view.backgroundColor = UIColor.red
            }
            else{
                self.view.backgroundColor = UIColor.yellow
            }
            playAgainButtonOutlet.isHidden = false;
            
            if(userSign == .paper){
                paperSignalOutlet.isHidden = false;
                paperSignalOutlet.isEnabled = true;
            }
            else{
                paperSignalOutlet.isHidden = true;
                paperSignalOutlet.isEnabled = false;
            }
            
            if(userSign == .rock){
                rockSignalOutlet.isHidden = false;
                rockSignalOutlet.isEnabled = true;
            }
            else{
                rockSignalOutlet.isHidden = true;
                rockSignalOutlet.isEnabled = false;
            }
            if(userSign == .scissors){
                scissorsSignalOutlet.isHidden = false;
                scissorsSignalOutlet.isEnabled = true;
            }
            else{
                scissorsSignalOutlet.isHidden = true;
                scissorsSignalOutlet.isEnabled = false;
            }
            
            
            
        }
    }
    
    func play(){
        let computerSign: Sign = randomSign()
        computerSignalOutlet.text = computerSign.textValue
        updateUI(oldUI: userSign.gameResult(versusState: computerSign))
    }
    
    
}

