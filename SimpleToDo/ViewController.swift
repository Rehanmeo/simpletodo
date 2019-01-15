//
//  ViewController.swift
//  SimpleToDo
//
//  Created by M.Rehan on 2019-01-06.
//  Copyright © 2019 M.Rehan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "todoback.jpg")
        image.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "todologo.png")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.backgroundColor = UIColor .clear
        logo.contentMode = .scaleAspectFill
        return logo
    }()

    var singupView: UIView = {
        let v = UIView()
        let color = UIColor(red: 124.0 / 255.0, green: 150.0 / 255.0, blue: 168.0 / 255.0, alpha: 1.0)
        v.backgroundColor = color.withAlphaComponent(0.5)
        v.layer.cornerRadius = 10
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor .black .cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var usernametxt: UITextField = {
        let txt: UITextField = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "username"
        let color = UIColor(red: 239.0 / 255.0, green: 242.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        txt.backgroundColor = color.withAlphaComponent(0.8)
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.black.cgColor
        return txt
    }()
    
    var passwordtxt: UITextField = {
        let txt: UITextField = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Password"
        txt.isSecureTextEntry = true
        let color = UIColor(red: 239.0 / 255.0, green: 242.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        txt.backgroundColor = color.withAlphaComponent(0.8)
        txt.layer.cornerRadius = 10
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.black.cgColor
        return txt
        
    }()
    
    var forgetbtn: UIButton = {
        let btn: UIButton = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot Password", for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = UIColor .clear
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(todomain(sender:)), for: .touchUpInside)
        btn.tag = 11
        return btn
    }()
    
    var loginBtn: UIButton = {
        let btn:UIButton = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("SIGN IN", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.titleLabel?.textAlignment = .center
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor(red: 201.0 / 255.0, green: 206.0 / 255.0, blue: 236.0 / 255.0, alpha: 1.0).withAlphaComponent(0.8)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.tag = 22
        btn.addTarget(self, action: #selector(todomain(sender:)), for: .touchUpInside)
        return btn
    }()
    
    var orlabel:UILabel = {
        let lb:UILabel = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "OR"
        lb.textColor = UIColor .black
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        return lb
    }()
    
    var signupButton: UIButton = {
        let btn: UIButton = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("SIGN UP", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.titleLabel?.textAlignment = .center
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor(red: 201.0 / 255.0, green: 206.0 / 255.0, blue: 236.0 / 255.0, alpha: 1.0).withAlphaComponent(0.8)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.tag = 33
        btn.addTarget(self, action: #selector(todomain(sender:)), for: .touchUpInside)
        return btn
    }()
    
    
    var socialButton: UIButton = {
        let btn:UIButton = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("SC", for: .normal)
        btn.setTitleShadowColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.titleLabel?.textAlignment = .center
        let color = UIColor(red: 20.0 / 255.0, green: 23.0 / 255.0, blue: 19.0 / 255.0, alpha: 1.0)
        btn.backgroundColor = color.withAlphaComponent(0.8)
        btn.tag = 44
        btn.layer.cornerRadius = 40
        btn.clipsToBounds = true
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.addTarget(self, action: #selector(todomain(sender:)), for: .touchUpInside)
        return btn
    }()
    

    @objc func todomain(sender: UIButton){
        if sender.tag == 11 {
            print("Forgot password yes")
        } else if sender.tag == 22 {
            print("Sign in button yes")
            let mainController = MainVC()
            self.present(mainController, animated: true, completion: nil)
        }else if sender.tag == 33 {
            print("Sign up button Yes")
            let nextVC = SignupVC()
            self.present(nextVC, animated: true, completion: nil)
        }else if sender.tag == 44{
            print("Sing up or Sign with Social")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLayout()
    }
    
    func setupLayout(){
        print("ViewController Setup Layout")
        //background Image
        self.view.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.singupView.addSubview(logoImage)
        logoImage.centerXAnchor.constraint(equalTo: singupView.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalToSystemSpacingBelow: singupView.topAnchor, multiplier: 1.5).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //Element View
        self.view.addSubview(singupView)
        singupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        singupView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        singupView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        singupView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        //user name TXT field
        self.singupView.addSubview(usernametxt)
        usernametxt.topAnchor.constraint(equalToSystemSpacingBelow: logoImage.bottomAnchor, multiplier: 1.5).isActive = true
        usernametxt.leadingAnchor.constraint(equalTo: singupView.leadingAnchor, constant: 10).isActive = true
        usernametxt.trailingAnchor.constraint(equalTo: singupView.trailingAnchor, constant: -10).isActive = true
        usernametxt.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //User password txt field
        self.singupView.addSubview(passwordtxt)
        passwordtxt.topAnchor.constraint(equalTo: usernametxt.bottomAnchor, constant: 10).isActive = true
        passwordtxt.leadingAnchor.constraint(equalTo: singupView.leadingAnchor, constant: 10).isActive = true
        passwordtxt.trailingAnchor.constraint(equalTo: singupView.trailingAnchor, constant: -10).isActive = true
        passwordtxt.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Forgot Password Button
        self.singupView.addSubview(forgetbtn)
        forgetbtn.topAnchor.constraint(equalTo: passwordtxt.bottomAnchor, constant: 0.5).isActive = true
        forgetbtn.trailingAnchor.constraint(equalTo: passwordtxt.trailingAnchor, constant: -0.1).isActive = true
        forgetbtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        //Sign In Botton
        self.singupView.addSubview(loginBtn)
        loginBtn.topAnchor.constraint(equalTo: forgetbtn.bottomAnchor, constant: 10).isActive = true
        loginBtn.leadingAnchor.constraint(equalTo: passwordtxt.leadingAnchor, constant: 0.0).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: passwordtxt.trailingAnchor, constant: -0.0).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //or label
        self.singupView.addSubview(orlabel)
        orlabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 8.0).isActive = true
        orlabel.centerXAnchor.constraint(equalTo: loginBtn.centerXAnchor).isActive = true
        orlabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        orlabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //Sign Up Button
        self.singupView.addSubview(signupButton)
        signupButton.topAnchor.constraint(equalTo: orlabel.bottomAnchor, constant: 10).isActive = true
        signupButton.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor, constant: 0.0).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: loginBtn.trailingAnchor, constant: 0.0).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Social Button
        self.view.addSubview(socialButton)
        socialButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        socialButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        socialButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        socialButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
}
