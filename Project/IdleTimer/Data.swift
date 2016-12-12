//
//  Data.swift
//  IdleTimer
//
//  Created by 한상훈 on 2016. 11. 1..
//  Copyright © 2016년 Sanghoon Han. All rights reserved.
//

import Foundation

//테이블 뷰에 쓰이는 데이터 입니다.

let dataCenter : dataClass = dataClass()
let dateFormatter = DateFormatter()



class dataClass {
    var count = 0
    var history : [historyClass]
    var coin = 30
    var category = ["Default", "Health", "Study", "Me", "Friend"]
    var item = [false, true, true, true, true, true]
    
    init() {
        history = [historyClass()]
        dateFormatter.dateFormat = "yyyy년 M월 d일"
    }
    
    var results:Dictionary<String,Int> = ["success":0, "fail":0]
    
}


class historyClass {
    var seconds : Int
    var title : String
    var success : Bool
    var date = NSDate()
    var category : String
    
    init(){
        seconds = 0
        title = "Sample"
        success = false
        date = NSDate()
        category = "Default"
    }

}





//StartVewConroller, DoingViewController에 쓰이는 데이터입니다.

let timerData : timerClass = timerClass()

class timerClass {
    var timerIsOn = false
    var timer = Timer()
    var minutes = 0
    var appOutTogle = true
}
