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
        var basil: UIImageView!
        basil = UIImageView(frame: CGRect(x: view.frame.minX + 2*spacer, y: view.frame.minY + spacer, width: view.frame.width - 4*spacer, height: view.frame.width - 4*spacer))
        basil.image = UIImage(named: "justbasil")
        self.view.addSubview(basil)
        basil.rotate(duration: 32)
        var dom: UIImageView!
        dom = UIImageView(frame: CGRect(x: basil.frame.minX, y: basil.frame.minY, width: basil.frame.width, height: basil.frame.height))
        dom.image = UIImage(named: "justdom")
        self.view.addSubview(dom)
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
        let labelHeight: CGFloat = 35
        let labelSpacer: CGFloat = 70
        
        var learn: UILabel!
        learn = UILabel(frame: CGRect(x: view.frame.minX + spacer, y: self.welcomeLabel.frame.maxY, width: view.frame.width - 2*spacer, height: labelHeight))
        learn.text = "Learn how to plant basil like Dom"
        learn.font = UIFont.systemFont(ofSize: 22)
        learn.adjustsFontSizeToFitWidth = true
        learn.numberOfLines = 1
        learn.textColor = .black
        learn.textAlignment = .center
        //learn.backgroundColor = .red
        self.view.addSubview(learn)
        
        var buy: UILabel!
        buy = UILabel(frame: CGRect(x: view.frame.minX + spacer, y: learn.frame.maxY + labelSpacer, width: view.frame.width - 2*spacer, height: labelHeight))
        buy.text = "Buy Dom's Basil Seeds\n\nConnect with Basil Lovers"
        buy.font = UIFont.systemFont(ofSize: 22)
        buy.adjustsFontSizeToFitWidth = true
        buy.numberOfLines = 1
        buy.textColor = .black
        buy.textAlignment = .center
        //buy.backgroundColor = .red
        self.view.addSubview(buy)
        
        var connect: UILabel!
        connect = UILabel(frame: CGRect(x: view.frame.minX + spacer, y: buy.frame.maxY + labelSpacer, width: view.frame.width - 2*spacer, height: labelHeight))
        connect.text = "Connect with Basil Lovers"
        connect.font = UIFont.systemFont(ofSize: 22)
        connect.adjustsFontSizeToFitWidth = true
        connect.numberOfLines = 1
        connect.textColor = .black
        connect.textAlignment = .center
        //connect.backgroundColor = .red
        self.view.addSubview(connect)
        
        setupInfoImages(labelSpacer, learn, buy, connect)
    }
    
    func setupInfoImages(_ imageHeight: CGFloat, _ learn: UILabel, _ buy: UILabel, _ connect: UILabel){
        let learnImg = UIImageView(frame: CGRect(x: view.frame.midX - imageHeight/2, y: learn.frame.maxY, width: imageHeight, height: imageHeight))
        learnImg.image = UIImage(named: "basilPlant")
        self.view.addSubview(learnImg)
        
        let buyImg = UIImageView(frame: CGRect(x: view.frame.midX - imageHeight/2, y: buy.frame.maxY, width: imageHeight, height: imageHeight))
        buyImg.image = UIImage(named: "seeds")
        self.view.addSubview(buyImg)
        
        let connectImg = UIImageView(frame: CGRect(x: view.frame.midX - imageHeight/2, y: connect.frame.maxY, width: imageHeight, height: imageHeight))
        connectImg.image = UIImage(named: "connect")
        self.view.addSubview(connectImg)
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

// Credit: https://stackoverflow.com/questions/9844925/uiview-infinite-360-degree-rotation-animation/26215725
extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"
    func rotate(duration: Double) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = .pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = .infinity
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
}

