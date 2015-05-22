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
    
    
    // Delcaring IBOutlets from the storyboard
    @IBOutlet weak var rpmInputField: NSTextField!
    @IBOutlet weak var xgInputField: NSTextField!

    @IBOutlet weak var xgLabel: NSTextField!
    @IBOutlet weak var rpmLabel: NSTextField!

    @IBOutlet weak var rotorLengthInputField: NSTextField!

    
    // If the view loaded, let's initialise with some default values and start listening...
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
        
        // Update the labels with some calculated values
        gFromRPM()
        rpmFromG()
    }
    
    
    override var representedObject: AnyObject? {
        didSet {
        }
    }
    
    
    override func controlTextDidChange (notification: NSNotification) {
        // Listen for NSNotifications when the input field values change and handle them
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
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        var rpm = (rpmInputField.stringValue as NSString).floatValue
        var rotor = (rotorLengthInputField.stringValue as NSString).floatValue
        
        // Then do the maths
        var result = pow((rpm/1000), 2) * rotor * 1.118
        
        // Then update the label appropriately
        xgLabel.stringValue = String(format: "%5.3f", result)
    }
    
    
    func rpmFromG() {
        // Do some maths based on the user input
        // Start by getting the values from the input fields and converting them to floats
        var g = (xgInputField.stringValue as NSString).floatValue
        var rotor = (rotorLengthInputField.stringValue as NSString).floatValue
        
        // Then do the maths
        var result = sqrt((g / (rotor * 1.118))) * 1000
        
        // Then update the label appropriately        
        rpmLabel.stringValue = String(format: "%5.3f", result)
    }
    
    
}