//
//  ViewController.swift
//  Emoji Dictionnary
//
//  Created by Smaine Milianni on 31/07/2017.
//  Copyright © 2017 Smaine Milianni. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tav: UITableView!

    var languageChoosen = "";
    var emojisArray : [Emoji] = [Emoji]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tav.dataSource = self;
        tav.delegate = self;
   
        //backgroundColor
        self.view.backgroundColor = UIColor(red: 187, green: 222/255, blue: 251, alpha: 1)
        
       requestApi(language: languageChoosen)
        }
    
   /* func createEmojiArray() -> [Emoji] {
     
    }*/
   
    func requestApi(language: String){
        let url = "http://localhost:8888/emoji-api/web/app_dev.php/emojis/" + language
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        var tempArr = [Emoji]()
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
                print("réponse = \(String(describing: response))") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
            }
            // let responseAPI = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(String(describing: responseAPI))") // Affiche dans la console la réponse de l'API
            if error == nil {
                // Ce que vous voulez faire.
                do {
                    if let parsedData = try JSONSerialization.jsonObject(with: data!) as? [[String:Any]]{
                        for item in parsedData {
                            let emoji = Emoji()
                            //Transform unicode on an Emoji
                            let strUnicodeEmoji = String(UnicodeScalar(Int(item["unicode"] as! String, radix: 16)!)!)
                            emoji.emojiString = strUnicodeEmoji as String;
                            emoji.description =  item["description"] as! String;
                            emoji.translate = item["translate"] as! String;
                            emoji.language = language
                            //emoji.translate = item["translation"]["translation"] as! String;
                            tempArr.append(emoji)
                        }
                        DispatchQueue.main.async {
                            
                            self.emojisArray = tempArr
                            //Reloading tableView once all parsing is complete
                            self.tav.reloadData()
                        }
                    }
                }
                catch   {
                    print("Could not serialise")
                }
            }
            
        }
        requestAPI.resume()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return emojisArray.count;
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "cellIdentifierEmoji"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EmojiZerCellTableViewCell
        
        let emoji = emojisArray[indexPath.row];
        cell.cellZerLabelName?.text = emoji.emojiString;
 
        return cell;
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let defVC = segue.destination as!
        SecondViewController;
        defVC.emojiSelect = sender as! Emoji
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emojiSelect = emojisArray[indexPath.row];
    
        performSegue(withIdentifier: "secondScreen", sender: emojiSelect)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreate
           }


}

