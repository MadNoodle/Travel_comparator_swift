//
//  Destination.swift
//  travel plan
//
//  Created by Mathieu Janneau on 30/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import Foundation
import UIKit

public class Destination {
  var name : String
  let price : Int
  let period : String
  let imageUrl : String
  
  init(_ name: String,_ price : Int,_ period : String, _ imageUrl: String){
    self.name = name
    self.price = price
    self.period = period
    self.imageUrl = imageUrl
  }
}

