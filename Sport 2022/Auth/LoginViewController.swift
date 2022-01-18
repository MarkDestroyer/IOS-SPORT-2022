//
//  LoginViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 29.12.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let authService = Auth.auth()
    private var token: AuthStateDidChangeListenerHandle!
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    @IBOutlet weak var SportImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SportImage.backgroundColor = .white
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        SportImage.loadGif(name: "sport")
        token = authService.addStateDidChangeListener{[weak self] auth, user in
            guard user != nil else {return}
            self?.showHomeVC()
        
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        viewWillAppear(animated)

        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }


    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {

        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }


    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func showHomeVC() {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") else {return}
        guard let window = self.view.window else {return}
        window.rootViewController = vc
    }
    
    func showAlert(title: String? , text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okControl = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okControl)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func SignInAction(_ sender: Any?) {
        
        guard let email = LoginTextField.text, LoginTextField.hasText,
              let password = PassWordTextField.text, PassWordTextField.hasText
                
        else {
            showAlert(title: "Ошибка Ввода", text: "Данные не введены")
            return
        }
        
        authService.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                self?.showAlert(title: "Ошибка Firebase", text: error.localizedDescription)
                return
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    @IBAction func SignUpAction(_ sender: Any) {
    
        guard let email = LoginTextField.text, LoginTextField.hasText,
              let password = PassWordTextField.text, PassWordTextField.hasText
        else {
            showAlert(title: "Ошибка Ввода", text: "Данные не введены")
            return
        }
        
        authService.createUser(withEmail: email, password: password) {[weak self] authResult, error in
            
            if let error = error {
                self?.showAlert(title: "Ошибка Firebase", text: error.localizedDescription)
                return
            }
            
            self?.SignInAction(nil)
        }
    }
}
