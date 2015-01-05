//
//  ViewController.swift
//  SampleMVVM
//
//  Created by Krzysztof Kunowski on 05/01/15.
//  Copyright (c) 2015 kkunowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var reversedTextLabel: UILabel!
    
    var textViewModel: TextViewModel = TextViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.inputTextField.becomeFirstResponder()
    }
    
    func bindViewModel() {
        // binds actual inputText value with view model property
        RAC(textViewModel, "stringText") <~ inputTextField.rac_textSignal()
        
        // subscribes back view model signal
        textViewModel.reversedTextStringSingal.subscribeNext({ (object) -> Void in
            let string = object as String
            self.reversedTextLabel.text = string
        })
    }
}

