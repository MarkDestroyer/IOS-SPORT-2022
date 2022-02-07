//
//  EntryViewController5.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit

class threeDayTrayning: UIViewController,UITextFieldDelegate {
    
    let repeatTextField1 = UITextField()
    let traningLabel1 = UILabel()
    let XLabel1 = UILabel()
    let wayTextField1 = UITextField()
    let XLabel1_1 = UILabel()
    let weightTextField1 = UITextField()
    
    let repeatTextField2 = UITextField()
    let traningLabel2 = UILabel()
    let XLabel2 = UILabel()
    let wayTextField2 = UITextField()
    let XLabel2_1 = UILabel()
    let weightTextField2 = UITextField()
    
    let repeatTextField3 = UITextField()
    let traningLabel3 = UILabel()
    let XLabel3 = UILabel()
    let wayTextField3 = UITextField()
    let XLabel3_1 = UILabel()
    let weightTextField3 = UITextField()
    
    let repeatTextField4 = UITextField()
    let traningLabel4 = UILabel()
    let XLabel4 = UILabel()
    let wayTextField4 = UITextField()
    let XLabel4_1 = UILabel()
    let weightTextField4 = UITextField()
    
    let repeatTextField5 = UITextField()
    let traningLabel5 = UILabel()
    let XLabel5 = UILabel()
    let wayTextField5 = UITextField()
    let XLabel5_1 = UILabel()
    let weightTextField5 = UITextField()
    
    let repeatTextField6 = UITextField()
    let traningLabel6 = UILabel()
    let XLabel6 = UILabel()
    let wayTextField6 = UITextField()
    let XLabel6_1 = UILabel()
    let weightTextField6 = UITextField()
    
    let x = 25
    let y = 120
    let otstup = 20
    let textRepeat = "8"
    let textWay = "3"
    let textWeight = "90"
    

    let planDayDB  = PlanDayDB()
    var planDayLocalDB: [TrainingPlanElement] = []
    let createElement = CreateExerciseAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planDayLocalDB = planDayDB.fetch()
        
        ServiceLabel(text: "Пятница", x: 25, y: 80) //День тренировки
        ServiceLabel(text: planDayLocalDB[12].date, x: 170, y: 80) //Дата тренировки
        
        //Тренировка 1
        traningLabel1.frame = CGRect(x: 25, y: 140, width: 200, height: 22)
        traningLabel1.textAlignment = .left
        traningLabel1.text = planDayLocalDB[12].exercise?.name
        traningLabel1.textColor = UIColor.black
        traningLabel1.font = UIFont.systemFont(ofSize: 22)
        traningLabel1.backgroundColor = UIColor.white
                
        repeatTextField1.frame = CGRect(x: 25+200, y: 140, width: 20, height: 22)
        repeatTextField1.textColor = UIColor.black
        repeatTextField1.delegate = self
        repeatTextField1.text = String(planDayLocalDB[12].replay)
        repeatTextField1.borderStyle = .roundedRect
        repeatTextField1.keyboardType = UIKeyboardType.default
        repeatTextField1.returnKeyType = UIReturnKeyType.done
        repeatTextField1.tag = 1
        
        XLabel1.frame = CGRect(x: 260, y: 140, width: 20, height: 22)
        XLabel1.textAlignment = .left
        XLabel1.text = "X"
        XLabel1.textColor = UIColor.black
        XLabel1.font = UIFont.systemFont(ofSize: 22)
        XLabel1.backgroundColor = UIColor.white
        
        wayTextField1.frame = CGRect(x: 280, y: 140, width: 20, height: 22)
        wayTextField1.textColor = UIColor.black
        wayTextField1.delegate = self
        wayTextField1.text = String(planDayLocalDB[12].counter)
        wayTextField1.borderStyle = .roundedRect
        wayTextField1.keyboardType = UIKeyboardType.default
        wayTextField1.returnKeyType = UIReturnKeyType.done
      
        XLabel1_1.frame = CGRect(x: 310, y: 140, width: 20, height: 22)
        XLabel1_1.textAlignment = .left
        XLabel1_1.text = "X"
        XLabel1_1.textColor = UIColor.black
        XLabel1_1.font = UIFont.systemFont(ofSize: 22)
        XLabel1_1.backgroundColor = UIColor.white
        
        weightTextField1.frame = CGRect(x: 330, y: 140, width: 45, height: 22)
        weightTextField1.textColor = UIColor.black
        weightTextField1.delegate = self
        weightTextField1.text = String(planDayLocalDB[12].weight)
        weightTextField1.borderStyle = .roundedRect
        weightTextField1.keyboardType = UIKeyboardType.default
        weightTextField1.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(traningLabel1)
        self.view.addSubview(repeatTextField1)
        self.view.addSubview(XLabel1)
        self.view.addSubview(wayTextField1)
        self.view.addSubview(XLabel1_1)
        self.view.addSubview(weightTextField1)
        
        //Тренировка 2
        traningLabel2.frame = CGRect(x: 25, y: 140+50, width: 200, height: 22)
        traningLabel2.textAlignment = .left
        traningLabel2.text = planDayLocalDB[13].exercise?.name
        traningLabel2.textColor = UIColor.black
        traningLabel2.font = UIFont.systemFont(ofSize: 22)
        traningLabel2.backgroundColor = UIColor.white
                
        repeatTextField2.frame = CGRect(x: 25+200, y: 140+50, width: 20, height: 22)
        repeatTextField2.textColor = UIColor.black
        repeatTextField2.delegate = self
        repeatTextField2.text = String(planDayLocalDB[13].replay)
        repeatTextField2.borderStyle = .roundedRect
        repeatTextField2.keyboardType = UIKeyboardType.default
        repeatTextField2.returnKeyType = UIReturnKeyType.done
        repeatTextField2.tag = 2
        
        XLabel2.frame = CGRect(x: 260, y: 140+50, width: 20, height: 22)
        XLabel2.textAlignment = .left
        XLabel2.text = "X"
        XLabel2.textColor = UIColor.black
        XLabel2.font = UIFont.systemFont(ofSize: 22)
        XLabel2.backgroundColor = UIColor.white
        
        wayTextField2.frame = CGRect(x: 280, y: 190, width: 20, height: 22)
        wayTextField2.textColor = UIColor.black
        wayTextField2.delegate = self
        wayTextField2.text = String(planDayLocalDB[13].counter)
        wayTextField2.borderStyle = .roundedRect
        wayTextField2.keyboardType = UIKeyboardType.default
        wayTextField2.returnKeyType = UIReturnKeyType.done
       
        XLabel2_1.frame = CGRect(x: 310, y: 190, width: 20, height: 22)
        XLabel2_1.textAlignment = .left
        XLabel2_1.text = "X"
        XLabel2_1.textColor = UIColor.black
        XLabel2_1.font = UIFont.systemFont(ofSize: 22)
        XLabel2_1.backgroundColor = UIColor.white
        
        weightTextField2.frame = CGRect(x: 330, y: 190, width: 45, height: 22)
        weightTextField2.textColor = UIColor.black
        weightTextField2.delegate = self
        weightTextField2.text = String(planDayLocalDB[13].weight)
        weightTextField2.borderStyle = .roundedRect
        weightTextField2.keyboardType = UIKeyboardType.default
        weightTextField2.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(traningLabel2)
        self.view.addSubview(repeatTextField2)
        self.view.addSubview(XLabel2)
        self.view.addSubview(wayTextField2)
        self.view.addSubview(XLabel2_1)
        self.view.addSubview(weightTextField2)
        
        //Тренировка 3
        traningLabel3.frame = CGRect(x: 25, y: 140+100, width: 200, height: 22)
        traningLabel3.textAlignment = .left
        traningLabel3.text = planDayLocalDB[14].exercise?.name
        traningLabel3.textColor = UIColor.black
        traningLabel3.font = UIFont.systemFont(ofSize: 22)
        traningLabel3.backgroundColor = UIColor.white
                
        repeatTextField3.frame = CGRect(x: 25+200, y: 140+100, width: 20, height: 22)
        repeatTextField3.textColor = UIColor.black
        repeatTextField3.delegate = self
        repeatTextField3.text = String(planDayLocalDB[14].replay)
        repeatTextField3.borderStyle = .roundedRect
        repeatTextField3.keyboardType = UIKeyboardType.default
        repeatTextField3.returnKeyType = UIReturnKeyType.done
        repeatTextField3.tag = 3
        
        XLabel3.frame = CGRect(x: 260, y: 140+100, width: 20, height: 22)
        XLabel3.textAlignment = .left
        XLabel3.text = "X"
        XLabel3.textColor = UIColor.black
        XLabel3.font = UIFont.systemFont(ofSize: 22)
        XLabel3.backgroundColor = UIColor.white
        
        wayTextField3.frame = CGRect(x: 280, y: 240, width: 20, height: 22)
        wayTextField3.textColor = UIColor.black
        wayTextField3.delegate = self
        wayTextField3.text = String(planDayLocalDB[14].counter)
        wayTextField3.borderStyle = .roundedRect
        wayTextField3.keyboardType = UIKeyboardType.default
        wayTextField3.returnKeyType = UIReturnKeyType.done
      
        XLabel3_1.frame = CGRect(x: 310, y: 240, width: 20, height: 22)
        XLabel3_1.textAlignment = .left
        XLabel3_1.text = "X"
        XLabel3_1.textColor = UIColor.black
        XLabel3_1.font = UIFont.systemFont(ofSize: 22)
        XLabel3_1.backgroundColor = UIColor.white
        
        weightTextField3.frame = CGRect(x: 330, y: 240, width: 45, height: 22)
        weightTextField3.textColor = UIColor.black
        weightTextField3.delegate = self
        weightTextField3.text = String(planDayLocalDB[14].weight)
        weightTextField3.borderStyle = .roundedRect
        weightTextField3.keyboardType = UIKeyboardType.default
        weightTextField3.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(traningLabel3)
        self.view.addSubview(repeatTextField3)
        self.view.addSubview(XLabel3)
        self.view.addSubview(wayTextField3)
        self.view.addSubview(XLabel3_1)
        self.view.addSubview(weightTextField3)
        
        //Тренировка 4
        traningLabel4.frame = CGRect(x: 25, y: 140+150, width: 200, height: 22)
        traningLabel4.textAlignment = .left
        traningLabel4.text = planDayLocalDB[15].exercise?.name
        traningLabel4.textColor = UIColor.black
        traningLabel4.font = UIFont.systemFont(ofSize: 22)
        traningLabel4.backgroundColor = UIColor.white
                
        repeatTextField4.frame = CGRect(x: 25+200, y: 140+150, width: 20, height: 22)
        repeatTextField4.textColor = UIColor.black
        repeatTextField4.delegate = self
        repeatTextField4.text = String(planDayLocalDB[15].replay)
        repeatTextField4.borderStyle = .roundedRect
        repeatTextField4.keyboardType = UIKeyboardType.default
        repeatTextField4.returnKeyType = UIReturnKeyType.done
        repeatTextField4.tag = 4
        
        XLabel4.frame = CGRect(x: 260, y: 140+150, width: 20, height: 22)
        XLabel4.textAlignment = .left
        XLabel4.text = "X"
        XLabel4.textColor = UIColor.black
        XLabel4.font = UIFont.systemFont(ofSize: 22)
        XLabel4.backgroundColor = UIColor.white
        
        wayTextField4.frame = CGRect(x: 280, y: 290, width: 20, height: 22)
        wayTextField4.textColor = UIColor.black
        wayTextField4.delegate = self
        wayTextField4.text = String(planDayLocalDB[15].counter)
        wayTextField4.borderStyle = .roundedRect
        wayTextField4.keyboardType = UIKeyboardType.default
        wayTextField4.returnKeyType = UIReturnKeyType.done
      
        XLabel4_1.frame = CGRect(x: 310, y: 290, width: 20, height: 22)
        XLabel4_1.textAlignment = .left
        XLabel4_1.text = "X"
        XLabel4_1.textColor = UIColor.black
        XLabel4_1.font = UIFont.systemFont(ofSize: 22)
        XLabel4_1.backgroundColor = UIColor.white
        
        weightTextField4.frame = CGRect(x: 330, y: 290, width: 45, height: 22)
        weightTextField4.textColor = UIColor.black
        weightTextField4.delegate = self
        weightTextField4.text = String(planDayLocalDB[15].weight)
        weightTextField4.borderStyle = .roundedRect
        weightTextField4.keyboardType = UIKeyboardType.default
        weightTextField4.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(traningLabel4)
        self.view.addSubview(repeatTextField4)
        self.view.addSubview(XLabel4)
        self.view.addSubview(wayTextField4)
        self.view.addSubview(XLabel4_1)
        self.view.addSubview(weightTextField4)
        
        //Тренировка 5
        traningLabel5.frame = CGRect(x: 25, y: 140+200, width: 200, height: 22)
        traningLabel5.textAlignment = .left
        traningLabel5.text = planDayLocalDB[16].exercise?.name
        traningLabel5.textColor = UIColor.black
        traningLabel5.font = UIFont.systemFont(ofSize: 22)
        traningLabel5.backgroundColor = UIColor.white
                
        
        repeatTextField5.frame = CGRect(x: 25+200, y: 140+200, width: 20, height: 22)
        repeatTextField5.textColor = UIColor.black
        repeatTextField5.delegate = self
        repeatTextField5.text = String(planDayLocalDB[16].replay)
        repeatTextField5.borderStyle = .roundedRect
        repeatTextField5.keyboardType = UIKeyboardType.default
        repeatTextField5.returnKeyType = UIReturnKeyType.done
        repeatTextField5.tag = 5
        
        XLabel5.frame = CGRect(x: 260, y: 140+200, width: 20, height: 22)
        XLabel5.textAlignment = .left
        XLabel5.text = "X"
        XLabel5.textColor = UIColor.black
        XLabel5.font = UIFont.systemFont(ofSize: 22)
        XLabel5.backgroundColor = UIColor.white
        
        wayTextField5.frame = CGRect(x: 280, y: 340, width: 20, height: 22)
        wayTextField5.textColor = UIColor.black
        wayTextField5.delegate = self
        wayTextField5.text = String(planDayLocalDB[16].counter)
        wayTextField5.borderStyle = .roundedRect
        wayTextField5.keyboardType = UIKeyboardType.default
        wayTextField5.returnKeyType = UIReturnKeyType.done
      
        XLabel5_1.frame = CGRect(x: 310, y: 340, width: 20, height: 22)
        XLabel5_1.textAlignment = .left
        XLabel5_1.text = "X"
        XLabel5_1.textColor = UIColor.black
        XLabel5_1.font = UIFont.systemFont(ofSize: 22)
        XLabel5_1.backgroundColor = UIColor.white
        
        weightTextField5.frame = CGRect(x: 330, y: 340, width: 45, height: 22)
        weightTextField5.textColor = UIColor.black
        weightTextField5.delegate = self
        weightTextField5.text = String(planDayLocalDB[16].weight)
        weightTextField5.borderStyle = .roundedRect
        weightTextField5.keyboardType = UIKeyboardType.default
        weightTextField5.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(traningLabel5)
        self.view.addSubview(repeatTextField5)
        self.view.addSubview(XLabel5)
        self.view.addSubview(wayTextField5)
        self.view.addSubview(XLabel5_1)
        self.view.addSubview(weightTextField5)
        
        //Тренировка 6
        traningLabel6.frame = CGRect(x: 25, y: 140+250, width: 200, height: 22)
        traningLabel6.textAlignment = .left
        traningLabel6.text = planDayLocalDB[17].exercise?.name
        traningLabel6.textColor = UIColor.black
        traningLabel6.font = UIFont.systemFont(ofSize: 22)
        traningLabel6.backgroundColor = UIColor.white
                
        repeatTextField6.frame = CGRect(x: 25+200, y: 140+250, width: 20, height: 22)
        repeatTextField6.textColor = UIColor.black
        repeatTextField6.delegate = self
        repeatTextField6.text = String(planDayLocalDB[17].replay)
        repeatTextField6.borderStyle = .roundedRect
        repeatTextField6.keyboardType = UIKeyboardType.default
        repeatTextField6.returnKeyType = UIReturnKeyType.done
        repeatTextField6.tag = 6
        
        XLabel6.frame = CGRect(x: 260, y: 140+250, width: 20, height: 22)
        XLabel6.textAlignment = .left
        XLabel6.text = "X"
        XLabel6.textColor = UIColor.black
        XLabel6.font = UIFont.systemFont(ofSize: 22)
        XLabel6.backgroundColor = UIColor.white
        
        wayTextField6.frame = CGRect(x: 280, y: 390, width: 20, height: 22)
        wayTextField6.textColor = UIColor.black
        wayTextField6.delegate = self
        wayTextField6.text = String(planDayLocalDB[17].counter)
        wayTextField6.borderStyle = .roundedRect
        wayTextField6.keyboardType = UIKeyboardType.default
        wayTextField6.returnKeyType = UIReturnKeyType.done
      
        XLabel6_1.frame = CGRect(x: 310, y: 390, width: 20, height: 22)
        XLabel6_1.textAlignment = .left
        XLabel6_1.text = "X"
        XLabel6_1.textColor = UIColor.black
        XLabel6_1.font = UIFont.systemFont(ofSize: 22)
        XLabel6_1.backgroundColor = UIColor.white
        
        weightTextField6.frame = CGRect(x: 330, y: 390, width: 45, height: 22)
        weightTextField6.textColor = UIColor.black
        weightTextField6.delegate = self
        weightTextField6.text = String(planDayLocalDB[17].weight)
        weightTextField6.borderStyle = .roundedRect
        weightTextField6.keyboardType = UIKeyboardType.default
        weightTextField6.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(traningLabel6)
        self.view.addSubview(repeatTextField6)
        self.view.addSubview(XLabel6)
        self.view.addSubview(wayTextField6)
        self.view.addSubview(XLabel6_1)
        self.view.addSubview(weightTextField6)
        
        saveTraningButton()
        // Do any additional setup after loading the view.
    }
    
    func ServiceLabel(text: String, x: Int, y: Int){
        let serviceLabel = UILabel()
        serviceLabel.frame = CGRect(x: x, y: y, width: 145, height: 22)
        serviceLabel.textAlignment = .left
        serviceLabel.text = text
        serviceLabel.textColor = UIColor.black
        serviceLabel.font = UIFont.systemFont(ofSize: 22)
        serviceLabel.backgroundColor = UIColor.white
        self.view.addSubview(serviceLabel)
    }
//    func traning(text: String, x: Int, y: Int){
//
//    }
    func saveTraningButton (){
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 28 , y: 600, width: 343, height: 56)
        button.addTarget(self, action: #selector(saveTraining), for: .touchDown)
        button.setTitle("Сохранить тренировку", for: .normal)
        button.layer.cornerRadius = 15
       // button.backgroundColor = UIColor(red: 0.11, green: 0.78, blue: 0.41, alpha: 1.00)
        button.backgroundColor = UIColor.blue
        button.tag = 5
        self.view.addSubview(button)
    }
    @objc func saveTraining(){
        
        let replay0: Int = Int(repeatTextField1.text! as String)!
        let counter0: Int = Int(wayTextField1.text! as String)!
        let weight0: Double = Double(weightTextField1.text! as String)!
        let ExId0: Int = planDayLocalDB[12].exercise!.id
        let exercise0: [String:Int] = ["id":ExId0]
        let date:String = planDayLocalDB[12].date
        
        let replay1: Int = Int(repeatTextField2.text! as String)!
        let counter1: Int = Int(wayTextField2.text! as String)!
        let weight1: Double = Double(weightTextField2.text! as String)!
        let ExId1: Int = planDayLocalDB[13].exercise!.id
        let exercise1: [String:Int] = ["id":ExId1]
     
        
        let replay2: Int = Int(repeatTextField3.text! as String)!
        let counter2: Int = Int(wayTextField3.text! as String)!
        let weight2: Double = Double(weightTextField3.text! as String)!
        let ExId2: Int = planDayLocalDB[14].exercise!.id
        let exercise2: [String:Int] = ["id":ExId2]
        
        
        let replay3: Int = Int(repeatTextField4.text! as String)!
        let counter3: Int = Int(wayTextField4.text! as String)!
        let weight3: Double = Double(weightTextField4.text! as String)!
        let ExId3: Int = planDayLocalDB[15].exercise!.id
        let exercise3: [String:Int] = ["id":ExId3]
        
     
        let replay4: Int = Int(repeatTextField5.text! as String)!
        let counter4: Int = Int(wayTextField5.text! as String)!
        let weight4: Double = Double(weightTextField5.text! as String)!
        let ExId4: Int = planDayLocalDB[16].exercise!.id
        let exercise4: [String:Int] = ["id":ExId4]
   
        let replay5: Int = Int(repeatTextField6.text! as String)!
        let counter5: Int = Int(wayTextField6.text! as String)!
        let weight5: Double = Double(weightTextField6.text! as String)!
        let ExId5: Int = planDayLocalDB[17].exercise!.id
        let exercise5: [String:Int] = ["id":ExId5]
        
        createElement.createPlan(date: date, exercise: exercise0, replay: replay0, counter: counter0, weight: weight0, description: "")
        createElement.createPlan(date: date, exercise: exercise1, replay: replay1, counter: counter1, weight: weight1, description: "")
        createElement.createPlan(date: date, exercise: exercise2, replay: replay2, counter: counter2, weight: weight2, description: "")
        createElement.createPlan(date: date, exercise: exercise3, replay: replay3, counter: counter3, weight: weight3, description: "")
        createElement.createPlan(date: date, exercise: exercise4, replay: replay4, counter: counter4, weight: weight4, description: "")
        createElement.createPlan(date: date, exercise: exercise5, replay: replay5, counter: counter5, weight: weight5, description: "")
   
    }
}

