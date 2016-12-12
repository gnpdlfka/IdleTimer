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
            dataCenter.results["success"]! += 1
            dataCenter.coin += Int(dataCenter.history[dataCenter.count].seconds)

            
            
            
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
                dataCenter.results["fail"]! += 1

                
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
            dataCenter.results["fail"]! += 1
            self.dismiss(animated: true, completion: nil)
    }
    
    var imageArray : [UIImage] = []
    


    @IBOutlet weak var Animation: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if (!dataCenter.item[0]){
            Animation.animationDuration = 1
            imageArray = [UIImage(named: "time0")!, UIImage(named: "time2")!, UIImage(named: "time3")!, UIImage(named: "time4")!, UIImage(named: "time4-1")!, UIImage(named: "time5")!, UIImage(named: "time5-1")!, UIImage(named: "time6")!, UIImage(named: "time7")!, UIImage(named: "time8")!, UIImage(named: "time9")!, UIImage(named: "time10")!, UIImage(named: "time11")!, UIImage(named: "time12")!, UIImage(named: "time13")!, UIImage(named: "time14")!, UIImage(named: "time15")!, UIImage(named: "time16")!, UIImage(named: "time17")!, UIImage(named: "time18")!]
        }
        if (!dataCenter.item[1]){
            Animation.animationDuration = 0.2
            imageArray = [UIImage(named: "water2")!, UIImage(named: "water3")!, UIImage(named: "water4")!]
        }
        if (!dataCenter.item[2]){
            Animation.animationDuration = 1.5
            imageArray = [UIImage(named: "light1")!, UIImage(named: "light2")!, UIImage(named: "light3")!, UIImage(named: "light5")!, UIImage(named: "light6")!, UIImage(named: "light7")!, UIImage(named: "light6")!, UIImage(named: "light5")!, UIImage(named: "light3")!, UIImage(named: "light2")!, UIImage(named: "light1")!]
        }
        if (!dataCenter.item[3]){
            Animation.animationDuration = 1.7
            imageArray = [UIImage(named: "ant1")!, UIImage(named: "ant2")!, UIImage(named: "ant3")!, UIImage(named: "ant2")!]
        }
        if (!dataCenter.item[4]){
            Animation.animationDuration = 1
            imageArray = [UIImage(named: "butterfly1")!, UIImage(named: "butterfly2")!, UIImage(named: "butterfly3")!, UIImage(named: "butterfly4")!, UIImage(named: "butterfly3")!, UIImage(named: "butterfly2")!]
        }
        if (!dataCenter.item[5]){
            Animation.animationDuration = 1
            imageArray = [UIImage(named: "worm1")!, UIImage(named: "worm2")!, UIImage(named: "worm3")!, UIImage(named: "worm2")!]
        }
        
        
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
