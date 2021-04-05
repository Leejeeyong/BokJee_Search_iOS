//
//  ViewController.swift
//  BokjeeSearchiOS
//
//  Created by JeeYong LEE on 2021/03/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //홈화면 이동 버튼
    @IBAction func HomeButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "showWebviewPage", sender: self)
    }
    

}

