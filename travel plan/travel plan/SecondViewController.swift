//
//  SecondViewController.swift
//  travel plan
//
//  Created by Mathieu Janneau on 01/11/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var priceDisplay: UILabel!
  
  var myImage = UIImage()
  var myString = String()
  var myPrice = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    image.image = myImage
    label.text = myString
    priceDisplay.text = "\(String(myPrice)) €"
  }
}
