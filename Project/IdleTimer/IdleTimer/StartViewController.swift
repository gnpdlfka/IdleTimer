//
//  StartViewController.swift
//  IdleTimer
//
//  Created by 한상훈 on 2016. 11. 25..
//  Copyright © 2016년 Sanghoon Han. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var coin: UIButton!
    
    @IBOutlet weak var timerTitle: UITextField!
    
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        coin.setTitle(String(dataCenter.coin)+" coin", for: .normal)
        for i in 0...4 {
            categorySegment.setTitle(dataCenter.category[i], forSegmentAt: i)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var timeInput: UIDatePicker!
    
    @IBAction func startButton(_ sender: AnyObject) {

        
        let thisHistory : historyClass = historyClass()
        if (timerTitle.text != ""){
            thisHistory.title = timerTitle.text!
        } else { thisHistory.title = "No Title"}
        
        thisHistory.seconds = Int(timeInput.countDownDuration/60)
        thisHistory.category = dataCenter.category[self.categorySegment.selectedSegmentIndex]
        
        
        dataCenter.history += [thisHistory]
        
        timerData.minutes = Int(timeInput.countDownDuration/60)*60

        dataCenter.count += 1


    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
