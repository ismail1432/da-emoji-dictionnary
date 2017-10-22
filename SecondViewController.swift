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
    
    var audioPlayer: AVAudioPlayer?
    
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    @IBOutlet weak var emojiToShow: UILabel!
    
    @IBAction func playBtnAction(_ sender: Any) {
       
        let audioFileName = emojiSelect.language+"_"+emojiSelect.description
         print("audio file name"+audioFileName)
        let audioFileURL = ""
        if let audioFileURL = Bundle.main.url(forResource: audioFileName, withExtension: "m4a", subdirectory: "audio/"+audioFileName) {
            print(audioFileURL)
        }
        
        let path = Bundle.main.path(forResource: audioFileURL, ofType:"m4a")!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emojiToShow.text = emojiSelect.emojiString
        emojiDescription.text = emojiSelect.description
        category.text = emojiSelect.translate.uppercased()
        
        
            }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
      
    }
    

}
