//
//  ViewController.swift
//  Multiples
//
//  Created by Parth Bhagwat on 8/7/16.
//  Copyright © 2016 Cool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var multiple = 0
    var runningSum = 0
    let MAX_SUM = 100000000000000
    
    // IBoutlets
    @IBOutlet weak var multiples: UIImageView!
    @IBOutlet weak var playbtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addbtn: UIButton!
    
    
    @IBAction func whenAddbtnPressed(sender: AnyObject){
        let newSum = runningSum + multiple
        updatelbl(runningSum, mul: multiple, newSum: newSum)
        runningSum += multiple
        
        if Gameover() {
            restartGame()
        }
    }
    
    @IBAction func whenPlaybtnPressed(sender: AnyObject){
   
        if textField.text != nil && textField.text != "" {

            multiples.hidden = true
            playbtn.hidden = true
            textField.hidden = true
            
            label.hidden = false
            addbtn.hidden = false
            
            resetlbl()
            multiple = Int(textField.text!)!
            runningSum = 0
        }
    }
    
    
    func restartGame(){
        multiple = 0
        textField.text = ""
        textField.hidden = false
        multiples.hidden = false
        playbtn.hidden = false
        label.hidden = true
        addbtn.hidden = true
        resetlbl()
        
    }
    
    func resetlbl() {
        label.text = "Press Add to add!"
    }
    
    
    func Gameover() -> Bool {
        if runningSum >= MAX_SUM{
            return true
        }else {
            return false
        }
    }
    
    func updatelbl(oldSum: Int, mul: Int, newSum: Int){
    label.text = "\(oldSum) + \(mul) = \(newSum)"
    }
}

