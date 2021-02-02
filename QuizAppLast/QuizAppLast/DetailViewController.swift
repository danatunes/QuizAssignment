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
    
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var LableTitle: UILabel!
   
    
    var currentQuestion = 0
    var score = 0
    var rightAnswer : UInt32 = 0
    var countQ = 1
    
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
            sender.backgroundColor = .green
        }else
        {
            print("WRONG!!!")
            sender.backgroundColor = .red
        }
        
        if currentQuestion != question.count{
            nextQuestion()
        }else{
            defaults.set(String(score),forKey: "score")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func resetColor()  {
        btnA.backgroundColor = .systemTeal
        btnB.backgroundColor = .systemTeal
        btnC.backgroundColor = .systemTeal
    }

    func nextQuestion(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.resetColor()
            self.questionNumberLabel.text = "\(self.countQ) : \(self.question.count)"
            self.LableTitle.text = self.question[self.currentQuestion]
            
            
            var button = UIButton()
            
            var x = 1
            
            for i in 1...3{
                button =  self.view.viewWithTag(i) as! UIButton
                
                if i == Int(self.rightAnswer){
                    
                    button.setTitle(self.answers[self.currentQuestion][0], for: .normal)
                }else{
                    button.setTitle(self.answers[self.currentQuestion][x], for: .normal)
                    x = 2
                }
                
            }
            self.currentQuestion += 1
            self.countQ += 1
        }
        
        }
       
}
