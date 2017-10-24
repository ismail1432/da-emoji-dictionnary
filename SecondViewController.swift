//
//  SecondViewController.swift
//  Emoji Dictionnary
//
//  Created by Smaine Milianni on 31/07/2017.
//  Copyright © 2017 Smaine Milianni. All rights reserved.
//

import AVFoundation
import UIKit

class SecondViewController: UIViewController {

    var emojiSelect = Emoji();
    var emojiDescribe = "Describe";
    
    @IBOutlet weak var emojiToShow: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emojiToShow.text = emojiSelect.emojiString
        emojiDescription.text = emojiSelect.description
  
            }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
      
    }
    

}
