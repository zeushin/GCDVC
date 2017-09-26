//
//  ViewController.swift
//  GCDVC
//
//  Created by Masher Shin on 9/26/17.
//  Copyright © 2017 Masher Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var indicator: UIActivityIndicatorView!
    var proArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        print(#function)
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        indicator.startAnimating()

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let sSelf = self else { return }
            sSelf.proArray.append("2")
            sSelf.proArray.append("3")
            Thread.sleep(forTimeInterval: 10)

            DispatchQueue.main.async {
                guard let sSelf = self else { return }
                sSelf.proArray.removeLast()
                print(sSelf.proArray)
                sSelf.indicator.stopAnimating()
            }
        }

//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//            self?.proArray.append("2")
//            self?.proArray.append("3")
//            Thread.sleep(forTimeInterval: 10)
//
//            DispatchQueue.main.async {
//                self?.proArray.removeLast()
//                print(self?.proArray ?? "")
//                self?.indicator.stopAnimating()
//            }
//        }
//
//        DispatchQueue.global(qos: .userInitiated).async {
//            self.proArray.append("2")
//            self.proArray.append("3")
//            Thread.sleep(forTimeInterval: 10)
//
//            DispatchQueue.main.async {
//                self.proArray.removeLast()
//                print(self.proArray ?? "")
//                self.indicator.stopAnimating()
//            }
//        }

    }

}

