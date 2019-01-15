//
//  mainVC.swift
//  SimpleToDo
//
//  Created by M.Rehan on 2019-01-07.
//  Copyright © 2019 M.Rehan. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    var label: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(label)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var backgroundImage: UIImageView = {
        let image:UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "todoback.jpg")
        return image
    }()
    
    fileprivate var headerview: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return v
    }()
    
    var profileImage: UIImageView = {
        let img: UIImageView = UIImageView()
        img.image = UIImage(named: "profile.jpg")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    var logoImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "todologo.png")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var prolabel: UILabel = {
        let l:UILabel = UILabel()
        l.text = "This IS Todo Application Save Daily Task her"
        l.numberOfLines = 3
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = UIColor .white
        l.textAlignment = .center
        return l
    }()
    
    var userName:UILabel = {
        let l = UILabel()
        l.text = "Muhammad Rehan"
        l.font = UIFont.boldSystemFont(ofSize: 12)
        l.textColor = UIColor .black
        return l
    }()
    
    var EditBtn: UIButton = {
        let b = UIButton(type: .system)
        //b.setImage(UIImage(named: "pencil-case.png"), for: .normal)
        b.setTitle("Edit", for: .normal)
        b.tag = 11
        b.addTarget(self, action: #selector(listButtomActions(sender:)), for: .touchUpInside)
        b.layer.cornerRadius = 25
        b.layer.masksToBounds = false
        b.clipsToBounds = true
        b.backgroundColor = UIColor .gray.withAlphaComponent(0.8)
        return b
    }()
    
    var logoutBtn: UIButton = {
        let b = UIButton(type: .system)
        //b.setImage(UIImage(named: "logout.png"), for: .normal)
        b.setTitle("Logout", for: .normal)
        b.tag = 22
        b.layer.cornerRadius = 25
        b.layer.masksToBounds = false
        b.clipsToBounds = true
        b.backgroundColor = UIColor .gray.withAlphaComponent(0.8)
        b.addTarget(self, action: #selector(listButtomActions(sender:)), for: .touchUpInside)
        return b
    }()
    
    var tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor .darkGray
        return tv
    }()
    
    @objc func listButtomActions(sender: UIButton){
        if sender.tag == 11 {
            print("Hello Button 11")
        }else if sender.tag == 22 {
            print("Hello Button 22")
        }
        
    }
    
    //Array and variables
    
    var simpleArray:Array = [
            "One",
            "Two",
            "Three"
    ]
    
    let cellIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor .red
        
        self.navigationController?.isNavigationBarHidden = true
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TableCell.self, forCellReuseIdentifier: cellIdentifier)
        setupLayout()
    }
    
    
    fileprivate func setupLayout(){

        [backgroundImage,headerview,tableview].forEach {self.view.addSubview($0)}
        
        [profileImage, logoImage,prolabel,userName,EditBtn,logoutBtn].forEach{self.headerview.addSubview($0)}
        
        
        backgroundImage.superViewAuto()
        headerview.anchors(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, padding: .zero, size: .init(width: 0, height: 120))
        
        profileImage.anchors(top: headerview.topAnchor, leading: headerview.leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: .init(width: 65, height: 80))
        profileImage.layer.cornerRadius = 40
        profileImage.layer.masksToBounds = false
        profileImage.clipsToBounds = true
        
        userName.anchors(top: profileImage.bottomAnchor, leading: headerview.leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 5, left: 8, bottom: 0, right: 0), size: .init(width: 0, height: 16))
        
        logoImage.anchors(top: headerview.topAnchor, leading: nil, trailing: nil, bottom: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 80))
        logoImage.centerXAnchor.constraint(equalTo: headerview.centerXAnchor).isActive = true
        
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.addArrangedSubview(EditBtn)
        stackview.addArrangedSubview(logoutBtn)
        self.headerview.addSubview(stackview)
        stackview.backgroundColor = UIColor .blue
        stackview.spacing = 5
        stackview.anchors(top: nil, leading: nil , trailing: headerview.trailingAnchor, bottom: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: .init(width: 60, height: 0))
        stackview.centerYAnchor.constraint(equalTo: headerview.centerYAnchor).isActive = true
        EditBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        EditBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        logoutBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        prolabel.anchors(top: logoImage.bottomAnchor, leading: nil, trailing: nil, bottom: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0), size: .init(width: 150, height:30 ))
        prolabel.centerXAnchor.constraint(equalTo: headerview.centerXAnchor).isActive = true
        tableview.anchors(top: headerview.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableCell
        
        cell.label.text = simpleArray[indexPath.row]
        
        return cell
        
    }
    
}

extension UIView{
    
    func superViewAuto(){
        anchors(top: superview?.topAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor, bottom: superview?.bottomAnchor)
    }
    
    
    func anchorSize(to view: UIView){
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    
    func anchors(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing:NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
             leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        
    }
}
