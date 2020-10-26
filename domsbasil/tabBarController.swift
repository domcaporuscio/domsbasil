//
//  tabBarController.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 10/26/20.
//

import UIKit

class tabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let learn = learnVC()
        learn.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let buy = buyVC()
        learn.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let connect = connectVC()
        connect.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        viewControllers = [learn, buy, connect]
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
