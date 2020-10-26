//
//  ViewController.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 10/26/20.
//

import UIKit

class ViewController: UIViewController {

    var welcomeLabel: UILabel!
    var spacer: CGFloat = 50
    var logo: UIImageView!
    var getStarted: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 69/255, green: 240/255, blue: 69/255, alpha: 1)
        setupLogo()
        setupWelcomeLabel()
        setupInfo()
        setupGetStarted()
    }
    
    func setupLogo() {
        logo = UIImageView(frame: CGRect(x: view.frame.minX + 2*spacer, y: view.frame.minY + spacer, width: view.frame.width - 4*spacer, height: view.frame.width - 4*spacer))
        logo.image = UIImage(named: "logo_transparent.png")
        self.view.addSubview(logo)
    }
    
    func setupWelcomeLabel() {
        welcomeLabel = UILabel(frame: CGRect(x: view.frame.minX + spacer, y: view.frame.midY - 200, width: view.frame.width - 2*spacer, height: 100))
        welcomeLabel.text = "Welcome to Dom's Basil"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 40)
        welcomeLabel.adjustsFontSizeToFitWidth = true;
        welcomeLabel.textColor = .black
        welcomeLabel.textAlignment = .center
        self.view.addSubview(welcomeLabel)
    }
    
    //TODO: increase spacing between lines
    func setupInfo(){
        var info: UILabel!
        info = UILabel(frame: CGRect(x: view.frame.minX + spacer, y: self.welcomeLabel.frame.maxY, width: view.frame.width - 2*spacer, height: 200))
        info.text = "Learn how to plant basil like Dom\n\nBuy Dom's Basil Seeds\n\nConnect with Basil Lovers"
        info.font = UIFont.systemFont(ofSize: 22)
        info.adjustsFontSizeToFitWidth = true
        info.numberOfLines = -1
        info.textColor = .black
        info.textAlignment = .left
        self.view.addSubview(info)
    }
    
    func setupGetStarted(){
        getStarted = UIButton(frame: CGRect(x: view.frame.minX + spacer, y: view.frame.maxY - 200, width: view.frame.width - 2*spacer, height: spacer))
        getStarted.layer.cornerRadius = spacer/2
        getStarted.setTitle("Get Started", for: .normal)
        getStarted.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        getStarted.backgroundColor = .black
        getStarted.setTitleColor(.white, for: .normal)
        getStarted.addTarget(self, action: #selector(pressedGetStarted), for: .touchUpInside)
        self.view.addSubview(getStarted)
    }

    @objc func pressedGetStarted(){
        print("pressed button")
    }

}

