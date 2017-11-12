//
//  Season.swift
//  travel plan
//
//  Created by Mathieu Janneau on 31/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation

public class Season {
  let name :String
  let startDate: Date
  let endDate: Date
  let engine = Engine()
  
  init(_ name:String,from  startDate: (Int,Int,Int),to endDate: (Int,Int,Int)){
    self.name = name
    self.startDate = engine.createDate (day :startDate.0, month: startDate.1, year: startDate.2)
    self.endDate = engine.createDate (day :endDate.0, month: endDate.1, year: endDate.2)
  }
  
}



