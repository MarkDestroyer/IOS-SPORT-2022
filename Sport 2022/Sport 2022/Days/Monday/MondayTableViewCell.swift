//
//  MondayTableViewCell.swift
//  Sport 2022
//
//  Created by Марк Киричко on 16.01.2022.
//

import UIKit

final class MondayTableViewCell: UITableViewCell {
    
    static let identifier = "MondayTableViewCell"
    

    @IBOutlet  weak var ExerciseImage: UIImageView!
    @IBOutlet  weak var nameLabel: UILabel!
    @IBOutlet  weak var ApproachLabel: UILabel!
    @IBOutlet  weak var ReplayLabel: UILabel!
    @IBOutlet  weak var WeightLabel: UILabel!
    
    func configure(_ monday: PlanDB)  {
        nameLabel.text = monday.name
        ApproachLabel.text = ("Подходов: \(String(monday.approach))")
        ReplayLabel.text = ("Повторений: \(String(monday.replay))")
        WeightLabel.text = ("Вес: \(String(monday.weight)) кг")
        ExerciseImage.layer.borderWidth = 3
        ExerciseImage.layer.masksToBounds = false
        ExerciseImage.layer.borderColor = UIColor.black.cgColor
        ExerciseImage.layer.cornerRadius = ExerciseImage.frame.height/2
        ExerciseImage.clipsToBounds = true
        
        
        if nameLabel.text == "отжимания" || nameLabel.text == "Отжимания" {
            ExerciseImage.image = UIImage(named: "отжимания")
        }
        
        if nameLabel.text == "пресс" || nameLabel.text == "Пресс" {
            ExerciseImage.image = UIImage(named: "пресс")
        }
        
        if nameLabel.text == "растяжка" || nameLabel.text == "Растяжка"  {
            ExerciseImage.image = UIImage(named: "растяжка")
        }
        
        if nameLabel.text == "жим лёжа" || nameLabel.text == "Жим лёжа" || nameLabel.text == "жим лежа" || nameLabel.text == "Жим лежа"   {
            ExerciseImage.image = UIImage(named: "жим лежа")
        }
        
        if nameLabel.text == "гантели" || nameLabel.text == "Гантели"  {
            ExerciseImage.image = UIImage(named: "гантели")
        }
        
        if nameLabel.text == "присед" || nameLabel.text == "Присед"  {
            ExerciseImage.image = UIImage(named: "присед")
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewOnTapped))
        ExerciseImage.addGestureRecognizer(tap)
        ExerciseImage.isUserInteractionEnabled = true
        
        

    }
    
    
    private func springAnimationExercises() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 300
        animation.mass = 3
        animation.duration = 3
        animation.beginTime = CACurrentMediaTime() + 0
        ExerciseImage.layer.add(animation, forKey: nil)
    }

    @objc func viewOnTapped() {
        springAnimationExercises()
    }

}
