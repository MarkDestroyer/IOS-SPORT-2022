//
//  SelectDateViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 05.02.2022.
//

import UIKit
import CalendarSwift

class SelectDateViewController: UIViewController,CalendarViewDelegate {
    ///Дата тренировки для запроса на сервер
    
    let exerciseDB  = ExerciseDB()
    let planDayAPI = TrainingPlanApi()
    let planDayDB  = PlanDayDB()
    var planDay: [TrainingPlanElement] = []
    var planDay1: [TrainingPlanElement] = []
    var planDay2: [TrainingPlanElement] = []
    var planDayLocalDB: [TrainingPlanElement] = []
    var createExerciseAPI = CreateExerciseAPI()
    
    @IBOutlet weak var calendarView: CalendarView!
    
    @IBAction func loadPlan(_ sender: Any) {
        exerciseDB.delete()
        planDayDB.addData(planDay)
        planDayDB.addData(planDay1)
        planDayDB.addData(planDay2)
    }
    
    @IBAction func beginTraning(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        
        self.calendarView.style.language = "ru"
        self.calendarView.delegate = self
        self.calendarView.setupCalendar()
        self.calendarView.selectedYearDelay = 0.3
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func calendarDateChanged(date: Date) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd" // Устанавливаем формат даты
        Session.shared.date = dateFormatter.string(from: date) // Конвертируем в строку
        print("Грузим понедельник")
        planDayAPI.getPlanDay{[weak self]  users in
        self?.planDay = users!
        }
        
         
        let nextDate = Calendar.current.date(byAdding: .day, value: 2, to: date)
        Session.shared.date = dateFormatter.string(from: nextDate!)
        print("Грузим среда")
        planDayAPI.getPlanDay{[weak self]  users in
        self?.planDay1 = users!
        }
        
        let nextDate1 = Calendar.current.date(byAdding: .day, value: 4, to: date)
        Session.shared.date = dateFormatter.string(from: nextDate1!)
        print("Грузим пятницу")
        planDayAPI.getPlanDay{[weak self]  users in
        self?.planDay2 = users!
        }
        
    }
    
    
    
}
