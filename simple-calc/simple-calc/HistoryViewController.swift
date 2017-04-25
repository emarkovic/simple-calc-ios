//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Personal on 4/24/17.
//  Copyright © 2017 Ena Markovic. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var historyItems: [String]?
    var mainViewController: ViewController?

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if historyItems != nil {
            for (index, item) in historyItems!.enumerated() {

                let label = UILabel(frame: CGRect(x: 0, y: index * 26, width: 200, height: 21))
                label.text = item
                self.scrollView.addSubview(label)
                
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
