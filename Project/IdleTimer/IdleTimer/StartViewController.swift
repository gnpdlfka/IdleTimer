//
//  StartViewController.swift
//  IdleTimer
//
//  Created by 한상훈 on 2016. 11. 25..
//  Copyright © 2016년 Sanghoon Han. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var timeInput: UIDatePicker!
    
    @IBAction func startButton(_ sender: AnyObject) {
        timerData.minutes = Int(timeInput.countDownDuration/60)*60
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
