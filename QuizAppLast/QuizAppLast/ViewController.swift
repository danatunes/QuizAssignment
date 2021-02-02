//
//  ViewController.swift
//  QuizAppLast
//
//  Created by Магжан Бекетов on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LabelScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let score = UserDefaults.standard.string(forKey: "score") ?? "0"
        LabelScore.text = "Last Score: \(score)"
    }

}

