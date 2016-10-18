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
        UIView.performWithoutAnimation {
     
            hand.setTitle("✋", for: UIControlState.normal)
            fisted.setTitle("👊", for: UIControlState.normal)
            victory.setTitle("✌️", for: UIControlState.normal)
            hand.isEnabled = true
            logo.text! = "🤖"
            message.text! = "石头,剪刀,布!"
        }
        
    }
    
    @IBAction func Show(_ sender: UIButton) {
        // hidden left and right
        fisted.isHidden = true
        victory.isHidden = true
        play.isHidden = false
        hand.isEnabled = false
        UIView.performWithoutAnimation {
            hand.setTitle(sender.currentTitle!, for: .normal)
        }
        // get system show
        let sys_res = randomSign()
        let user_res = sender.currentTitle!
        let result = cacl(sys_res, user_res)
        
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
        
    }
}

