//
//  MainController.swift
//  Emoji Dictionnary
//
//  Created by Smaine Milianni on 20/09/2017.
//  Copyright © 2017 Smaine Milianni. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet weak var englishBtn: UIButton!
    
<<<<<<< HEAD
    @IBOutlet weak var spanishBtn: UIButton!
=======
>>>>>>> 7dea19e9522b1c89c10df7ba199e54627b85f611
    @IBOutlet weak var frenchBtn: UIButton!
    @IBOutlet weak var arabicBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
<<<<<<< HEAD
    @IBAction func spanishActionBtn(_ sender: Any) {
         sendLanguageToViewController(language: "spanish")
    }
=======
>>>>>>> 7dea19e9522b1c89c10df7ba199e54627b85f611
    @IBAction func englishActionBtn(_ sender: Any) {
        sendLanguageToViewController(language: "english")
    }
    @IBAction func arabicActionBtn(_ sender: Any) {
        sendLanguageToViewController(language: "arabic")
    }

    @IBAction func frenchActionBtn(_ sender: Any) {
       
        sendLanguageToViewController(language: "french")
    }
    
    func sendLanguageToViewController(language: String){
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        myVC.languageChoosen = language
        navigationController?.pushViewController(myVC, animated: true)
    }
    

    

}
