//
//  ViewController.swift
//  Centrifuge Calculator
//
//  Created by Tim Snow on 21/05/2015.
//  Copyright (c) 2015 Tim Snow. All rights reserved.
//
//  Equations from: http://www.hettweb.com/mobile-app
//


import Cocoa


class ViewController: NSViewController, NSTextFieldDelegate {
    
    
    @IBOutlet weak var rpmInputField: NSTextField!
    @IBOutlet weak var xgInputField: NSTextField!

    @IBOutlet weak var xgLabel: NSTextField!
    @IBOutlet weak var rpmLabel: NSTextField!

    @IBOutlet weak var rotorLengthInputField: NSTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rpmInputField.delegate = self
        rpmInputField.stringValue = "1"
        
        xgInputField.delegate = self
        xgInputField.stringValue = "1"
        
        xgLabel.stringValue = "1"
        rpmLabel.stringValue = "1"
        
        rotorLengthInputField.delegate = self
        rotorLengthInputField.stringValue = "1"
        
        gFromRPM()
        rpmFromG()
    }
    
    
    override var representedObject: AnyObject? {
        didSet {
        }
    }
    
    
    override func controlTextDidChange (notification: NSNotification) {
        if notification.object?.description == rpmInputField.description {
            gFromRPM()
        }
        
        if notification.object?.description == xgInputField.description {
            rpmFromG()
        }
        
        if notification.object?.description == rotorLengthInputField.description {
            gFromRPM()
            rpmFromG()
       }
    }
    
    
    func gFromRPM() {
        var rpm = (rpmInputField.stringValue as NSString).floatValue
        var rotor = (rotorLengthInputField.stringValue as NSString).floatValue
        
        var result = pow((rpm/1000), 2) * rotor * 1.118
        
        xgLabel.stringValue = String(format: "%5.3f", result)
    }
    
    
    func rpmFromG() {
        var g = (xgInputField.stringValue as NSString).floatValue
        var rotor = (rotorLengthInputField.stringValue as NSString).floatValue
        
        var result = sqrt((g / (rotor * 1.118))) * 1000
        
        rpmLabel.stringValue = String(format: "%5.3f", result)
    }
    
    
}