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
            timerData.timer.invalidate()
            timerData.timerIsOn = false
            dataCenter.history[dataCenter.count].success = true
            dataCenter.coin = Int(dataCenter.history[dataCenter.count].seconds)

            
            
            
            if let SoundURL = Bundle.main.url(forResource: "clear_sound", withExtension:"mp3"){
                var mySound : SystemSoundID = 0
                AudioServicesCreateSystemSoundID(SoundURL as CFURL, &mySound)
                AudioServicesPlaySystemSound(mySound)
            }
            Animation.stopAnimating()

            let alertController = UIAlertController(title: "타이머 완료", message: "타이머가 완료되었습니다. 축하합니다", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            timerData.minutes -= 1
            timerLabel.text = "\(timerData.minutes/60)"+" min"+" \(timerData.minutes%60)"+" sec"
            if (!timerData.appOutTogle){
                timerData.timer.invalidate()
                timerData.timerIsOn = false
                dataCenter.history[dataCenter.count].success = false

                
                let alertController = UIAlertController(title: "타이머 실패", message: "앱에서 나가시면 타이머가 취소됩니다", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                    self.dismiss(animated: true, completion: nil)
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)

                timerData.appOutTogle = true
            }
        }
    }
    
    @IBOutlet weak var doingTitle: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var doingCategory: UILabel!

    @IBOutlet weak var doingCoin: UILabel!
    
    @IBAction func cancelButton(_ sender: AnyObject) {
            timerData.timer.invalidate()
            timerData.timerIsOn = false
            dataCenter.history[dataCenter.count].success = false
            self.dismiss(animated: true, completion: nil)
    }
    
    let imageArray = [UIImage(named: "anim0")!, UIImage(named: "anim1")!, UIImage(named: "anim2")!, UIImage(named: "anim3")!]

    @IBOutlet weak var Animation: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if (timerData.timerIsOn == false){
            timerData.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(DoingViewController.updateTimer)), userInfo: nil, repeats: true)
            timerData.timerIsOn = true
        }
        //이 뷰에 들어오면 바로 타이머 동작 시작
        
        
        Animation.animationImages = imageArray
        Animation.startAnimating()
        
        doingTitle.text = dataCenter.history[dataCenter.count].title
        doingCategory.text = dataCenter.history[dataCenter.count].category
        doingCoin.text = "\(Int(dataCenter.history[dataCenter.count].seconds))" + " coins"
        
        timerLabel.text = "\(dataCenter.history[dataCenter.count].seconds)" + " min 0 sec"
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
