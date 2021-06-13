//
//  ViewController.swift
//  BokjeeSearchiOS
//
//  Created by JeeYong LEE on 2021/03/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainBox: UIImageView!
    var age: String!
    var local: String!
    var locald: String!
    var target: String!
    
    var user = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainBox.layer.masksToBounds = true
        mainBox.layer.cornerRadius = 5
        age = user.string(forKey: "AGE")
        local = user.string(forKey: "LOCAL")
        locald = user.string(forKey: "LOCALD")
        target = user.string(forKey: "TARGET")
        
        
    }
    
    func saveUserData(age: String, local: String, locald: String, target: String){
        user.setValue(age, forKey: "AGE")
        user.setValue(local, forKey: "LOCAL")
        user.setValue(locald, forKey: "LOCALD")
        user.setValue(target, forKey: "TARGET")
        user.synchronize()
    }
    
    //홈화면 이동 버튼
    @IBAction func HomeButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "showWebviewPage", sender: self)
    }
    @IBAction func TargetButtonAction(_ sender: Any) {
        
        //맞춤 데이터가 없는 경우
        if(age == "" || age == nil){
            self.performSegue(withIdentifier: "showWebviewPage", sender: self)
        }
        //맞춤 데이터가 존재 하는 경우
        else{
            self.performSegue(withIdentifier: "showWebviewPage", sender: self)
        }
        
    }
    

}

