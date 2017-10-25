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
    var current = 0;
    var datas = Array<Any>();
    var emojisArray = Array<Any>();
    var emojiNext = Emoji();
    var emojiPrev = Emoji();
    var emojiDescribe = "Describe";

    @IBAction func btnPrev(_ sender: Any) {
        current -= 1
        
        current = (current < 0 ) ? emojisArray.count - 1 : current
        print(current)
        showEmoji(current: current)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        current += 1
        current = (current == emojisArray.count) ? 0 : current
        showEmoji(current: current)
    }
    
    func showEmoji(current: Int){
        emojiSelect = emojisArray[current] as! Emoji
        emojiToShow.text = emojiSelect.emojiString
        emojiDescription.text = emojiSelect.description
    }
  
    @IBOutlet weak var emojiToShow: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojisArray = datas[0] as! Array
        current = datas[1] as! Int
        showEmoji(current: current)
            }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
      
    }
    

}
