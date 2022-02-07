//
//  Session.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

final class Session{
    
    private init(){} //  Закрываем инит
    
    static let shared = Session() // Мы переиспользуем один и тот же объект
    
    var token: String = "" //Token VK
    var userId: Int = 0    //ID пользователя
    var userProfile: UserProfile?
    var date: String = "2022-02-06"
}
