//
//  SecondViewController.swift
//  travel plan
//
//  Created by Mathieu Janneau on 01/11/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  var myString = String()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label.text = myString
  }
}
