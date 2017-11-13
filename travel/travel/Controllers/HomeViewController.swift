//
//  HomeViewController.swift
//  travel
//
//  Created by Mathieu Janneau on 11/11/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // UI variable declaration
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var priceDisplay: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }

  // Grab slider value and update price display
  @IBAction func sliderValue(_ sender: Any) {
    self.priceDisplay.text = String(Int(self.slider.value)) + " €"
  }
  
  // On click action button

  @IBAction func goToSecondView(_ sender: UIButton) {
    
    var dateChoice : Date
    var maxPrice : Int
    let engine = Engine()
    
    //getting date info from picker
    dateChoice = datePicker.date
    
    //getting price info from slider
    maxPrice = Int(self.slider.value)
   
    let secondVc = ResultViewController()
    
    
    secondVc.myImage = engine.compareData(date: dateChoice, price: maxPrice).2!
    secondVc.myString = engine.compareData(date: dateChoice, price: maxPrice).0
    secondVc.myPrice = engine.compareData(date: dateChoice, price: maxPrice).1
    present(secondVc, animated: false, completion: nil)
  }
  

}
