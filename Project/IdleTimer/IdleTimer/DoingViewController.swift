//
//  DoingViewController.swift
//  IdleTimer
//
//  Created by 한상훈 on 2016. 11. 25..
//  Copyright © 2016년 Sanghoon Han. All rights reserved.
//

import UIKit
import AVFoundation

class DoingViewController: UIViewController {

    func updateTimer() {
        if (timerData.minutes == 55) {
            cancelButton(self)
            
            if let SoundURL = Bundle.main.url(forResource: "clear_sound", withExtension:"mp3"){
                            var mySound : SystemSoundID = 0
                            AudioServicesCreateSystemSoundID(SoundURL as CFURL, &mySound)
                            AudioServicesPlaySystemSound(mySound)
                            }
            
            let alertController = UIAlertController(title: "타이머 완료", message: "타이머가 완료되었습니다. 축하합니다", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
         
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            timerData.minutes -= 1
            timerLabel.text = "\(timerData.minutes/60)"+" min"+" \(timerData.minutes%60)"+" sec"
        }
    }
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    

    @IBAction func cancelButton(_ sender: AnyObject) {
            timerData.timer.invalidate()
            timerData.timerIsOn = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (timerData.timerIsOn == false){
            timerData.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(DoingViewController.updateTimer)), userInfo: nil, repeats: true)
            timerData.timerIsOn = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
