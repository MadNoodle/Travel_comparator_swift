//
//  ViewController.swift
//  travel plan
//
//  Created by Mathieu Janneau on 25/10/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //UI element linking
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var price: UILabel!
  
  //slider interaction
  @IBAction func sliderValue(_ sender: Any) {
    // display the value in label
    self.price.text = String(Int(self.slider.value)) + " €"
  }
  
  //Button on click event
  @IBAction func search(_ sender: UIButton) {
    var dateChoice : Date
    var maxPrice : Int
    let engine = Engine()
    //getting date info from picker
    dateChoice = datePicker.date
    
    //getting price info from slider
    maxPrice = Int(self.slider.value)
    
    engine.compareData(date: dateChoice, price: maxPrice)
    //function to look for proposal
  }
  
}


