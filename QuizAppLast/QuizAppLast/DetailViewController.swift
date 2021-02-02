//
//  DetailViewController.swift
//  QuizAppLast
//
//  Created by Магжан Бекетов on 02.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

    let question = ["First question" , "Second question" , "Third Question"]
    let answers = [["First answer.","Second answer." , "Third answer."],["First answer.","Second answer." , "Third answer."],["First answer.","Second answer." , "Third answer."]]
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var LableTitle: UILabel!
    
    var currentQuestion = 0
    var score = 0
    var rightAnswer : UInt32 = 0
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnA.layer.cornerRadius = 10
        btnB.layer.cornerRadius = 10
        btnC.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
    }
    
    @IBAction func btn(_ sender: UIButton) {
    
        
        if sender.tag == Int(rightAnswer){
            
            print("RIGHT!!!")
            score += 1
        }else
        {
            print("WRONG!!!")
        }
        
        if currentQuestion != question.count{
            nextQuestion()
        }else{
            defaults.set(String(score),forKey: "score")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
    }

    func nextQuestion(){
        
        LableTitle.text = question[currentQuestion]
        
        rightAnswer = arc4random_uniform(3) + 1
        
        var button = UIButton()
        
        var x = 1
        
        for i in 1...3{
            button =  view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswer){
                
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }else{
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
            
        }
        currentQuestion += 1
    }
}
