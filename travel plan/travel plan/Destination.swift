//
//  Destination.swift
//  travel plan
//
//  Created by Mathieu Janneau on 30/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation

public class Destination {
  var name : String
  let price : Int
  let period : String
  
  init(_ name: String,_ price : Int,_ period : String){
    self.name = name
    self.price = price
    self.period = period
  }
}
