//
//  ViewController.swift
//  RPS
//
//  Created by Xiang, Zhuyuan | Matt | ISDOD on 17/10/16.
//  Copyright © 2016 Xiang, Zhuyuan | Matt | ISDOD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var logo: UILabel!
    
    @IBOutlet weak var victory: UIButton!
    @IBOutlet weak var hand: UIButton!
    @IBOutlet weak var fisted: UIButton!
    @IBOutlet weak var play: UIButton!
    
    
    @IBAction func Play(_ sender: UIButton) {
        hand.isHidden = false
        fisted.isHidden = false
        victory.isHidden = false
        play.isHidden = true
        
        hand.setTitle("✋", for: UIControlState.normal)
        fisted.setTitle("👊", for: UIControlState.normal)
        victory.setTitle("✌️", for: UIControlState.normal)
        hand.isEnabled = true
        logo.text! = "🤖"
        message.text! = "石头,剪刀,布!"

    }

    @IBAction func Show(_ sender: UIButton) {
    
//        switch sender {
//        case victory:
//            hand.isHidden = true
//            fisted.isHidden = true
//        case hand:
//            fisted.isHidden = true
//            victory.isHidden = true
//        case fisted:
//            hand.isHidden = true
//            victory.isHidden = true
//        default:
//            hand.isHidden = false
//            fisted.isHidden = false
//            victory.isHidden = false
//            
//        }
        
        // hidden left and right
        fisted.isHidden = true
        victory.isHidden = true
        hand.setTitle(sender.currentTitle!, for: .normal)
        hand.isEnabled = false
        
        // get system show
        let sys_res = randomSign()
        let user_res = sender.currentTitle!
        var result = ""
        switch sys_res {
        case .paper:
            switch user_res{
                case "✌️":
                
                  result =   GameState.Win.rawValue
                case "👊":
                    result = GameState.Lost.rawValue
                case "✋":
                    result = GameState.Draw.rawValue
            default:
                result = ""
            }
            
        
        case .rock:
            
            
            switch user_res{
            case "✌️":
                result =   GameState.Lost.rawValue

                
            case "👊":
                result =   GameState.Draw.rawValue
                
            case "✋":
                
               result =  GameState.Win.rawValue
            default:
                result = ""
            }

        case .scissors:
            
            
            switch user_res{
            case "✌️":
                result = GameState.Draw.rawValue
                
            case "👊":
                result = GameState.Win.rawValue
                
            case "✋":
                result = GameState.Lost.rawValue
            default:
                result = ""
                
            }
        }
//        // create the alert
//        let alert = UIAlertController(title: "My Title", message: result, preferredStyle: UIAlertControllerStyle.alert)
//        
//        // add an action (button)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        
//        // show the alert
//        self.present(alert, animated: true, completion: nil)
        
        switch sys_res{
        case .rock:
           logo.text! =  "👊"
        case .paper:
           logo.text! =  "✋"
        case .scissors:
           logo.text! =  "✌️"
        default:
           logo.text! =  ""
        
        }
        message.text! = " You " + result
        play.isHidden = false
        // hide the others
        
        
        
    }
}

