//
//  ResultViewController.swift
//  travel
//
//  Created by Mathieu Janneau on 12/11/2017.
//  Copyright © 2017 Mathieu Janneau. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
  
  // Variable declaration
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var label: UILabel!
  
  @IBOutlet weak var priceDisplay: UILabel!
 
  
  var myImage = UIImage()
  var myString = String()
  var myPrice = 0
  override func viewDidLoad() {
        super.viewDidLoad()
    // grab information sent by HomeViewController
        image.image = myImage
        print(myString)
        label.text = myString
        priceDisplay.text = "\(String(myPrice)) €"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
