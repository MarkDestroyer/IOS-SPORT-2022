//
//  LoginViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Strapi_iOS
import UIKit

class LoginViewController: UIViewController {
    let strapi = Strapi.shared
    var data: Data?
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    @IBOutlet weak var SportImage: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Начало работы программы")
        SportImage.loadGif(name: "sport")
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        ScrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewWillAppear(animated)

        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func hideKeyboard() {
        self.ScrollView?.endEditing(true)
    }


    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {

        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
    }

    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //"zeons@mail.ru",
    //"P@ssw0rd"
    
    
    @IBAction func login() {
        print("Начало работы программы")
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        
        strapi.login(
            identifier:  "zeons@mail.ru",
            password: "P@ssw0rd") { response in
          //  guard let record = response.data as? [String: Any] else {return}
                guard let record = response.data  else {return}
                self.data = record as? Data
                print(self.data?.prettyJSON)
                print("Получили ответ, декодим JSON, присвоили его переменным")
                
              //  Session.shared.userProfile = record
                do{
                    let userProfile = try? JSONDecoder().decode(UserProfile.self, from: self.data!)
                    Session.shared.userProfile = userProfile
                    Session.shared.token = userProfile!.jwt
                    print("Получили токен ")
                    print(Session.shared.token)
                    
                }catch{
                    print("Operations Error")
                    print(error)
                }
                
          }
    }
    
    
    private func showHomeVC() {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") else {return}
        guard let window = self.view.window else {return}
        window.rootViewController = vc
    }
  }
