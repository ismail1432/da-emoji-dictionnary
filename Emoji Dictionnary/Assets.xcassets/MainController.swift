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
    

    @IBOutlet weak var spanishBtn: UIButton!

    @IBOutlet weak var frenchBtn: UIButton!
    @IBOutlet weak var arabicBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func spanishActionBtn(_ sender: Any) {
         sendLanguageToViewController(language: "spanish")
    }

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
