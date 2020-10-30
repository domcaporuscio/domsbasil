//
//  connectVC.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 10/26/20.
//

import UIKit

class connectVC: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
    }
    func setupTitleLabel(){
        label = UILabel(frame: CGRect(x: view.frame.minX, y: view.frame.minY + 54, width: view.frame.width, height: 45))
        label.textAlignment = .center
        label.text = "Connect"
        self.view.addSubview(label)
        //label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 25)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
