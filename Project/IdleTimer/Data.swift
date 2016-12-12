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

class dataClass: NSObject, NSCoding {
    var count:Int = 0
    var history : [historyClass]
    var coin:Int = 30
    var category = ["Default", "Health", "Study", "Me", "Friend"]
    var item:[Bool] = [false, true, true, true, true, true]

    override init() {
        history = [historyClass()]
        dateFormatter.dateFormat = "yyyy년 M월 d일"
    }
    required init?(coder aDecoder: NSCoder) {
        self.count = aDecoder.decodeObject(forKey: "count") as! Int
        self.history = aDecoder.decodeObject(forKey: "history") as! [historyClass]
        self.coin = aDecoder.decodeObject(forKey: "coin") as! Int
        self.item = aDecoder.decodeObject(forKey: "item") as! [Bool]
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encodeConditionalObject(self.count, forKey: "count")
        aCoder.encodeConditionalObject(self.history, forKey: "history")
        aCoder.encodeConditionalObject(self.coin, forKey: "coin")
        aCoder.encodeConditionalObject(self.item, forKey: "item")
    }
    var results:Dictionary<String,Int> = ["success":0, "fail":0]
}

class historyClass: NSObject, NSCoding {
    var seconds : Int
    var title : String
    var success : Bool
    var date = NSDate()
    var category : String
    
    override init(){
        seconds = 0
        title = "Sample"
        success = false
        date = NSDate()
        category = "Default"
    }
    required init?(coder aDecoder: NSCoder) {
        self.seconds = aDecoder.decodeObject(forKey: "seconds") as! Int
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.success = aDecoder.decodeObject(forKey: "success") as! Bool
        self.date = aDecoder.decodeObject(forKey: "date") as! NSDate
        self.category = aDecoder.decodeObject(forKey: "category") as! String
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encodeConditionalObject(self.seconds, forKey: "seconds")
        aCoder.encodeConditionalObject(self.title, forKey: "title")
        aCoder.encodeConditionalObject(self.success, forKey: "success")
        aCoder.encodeConditionalObject(self.date, forKey: "date")
        aCoder.encodeConditionalObject(self.category, forKey: "category")
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
