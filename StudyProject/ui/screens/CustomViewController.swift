//
//  CustomViewController.swift
//  StudyProject
//
//  Created by Stanislav on 04.03.2025.
//

import UIKit

class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func setClickListener(_ sender: UIButton) {
        performSegue(withIdentifier: "customSegue", sender: nil)
    }
    
}

class Custom2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
