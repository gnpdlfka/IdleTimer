//
//  Data.swift
//  IdleTimer
//
//  Created by 한상훈 on 2016. 11. 1..
//  Copyright © 2016년 Sanghoon Han. All rights reserved.
//

import Foundation

let dataCenter : dataClass = dataClass()

class dataClass {
    var history : [historyClass]
    var resource = [0, 1]
    
    init() {
        let abc = historyClass()
        history = [abc]
    }
}

class historyClass {
    var start : Int = 0
    var end : Int = 0
    var title : String = "Basic Timer"
    var success : Bool = false
}

class resource {
    var resourceNow : Int = 0
    
    func completed() {
        resourceNow += 2
    }
    func failed() {
        resourceNow -= 1
    }
    func purchased() {
        resourceNow -= 2
    }
}

//1.History(start, end, title, category, success)
//
//2.Resource ->
//Completed, Failed, Purchased
//
//3.ItemList, MyItemList
//
//4.Status(counting, done)
