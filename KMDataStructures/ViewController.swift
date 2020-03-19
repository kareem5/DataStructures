//
//  ViewController.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/18/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testDLinkedListString()
        testDLinkedListInt()
    }
    
    func testDLinkedListString() {
        let dogBreeds = LinkedList<String>()
        dogBreeds.append(value: "Labrador")
        dogBreeds.append(value: "Bulldog")
        dogBreeds.append(value: "Beagle")
        dogBreeds.append(value: "Husky")
        print("dogBreeds: \(dogBreeds)")
    }

    func testDLinkedListInt() {
        let numbersTrain = LinkedList<Int>()
        numbersTrain.append(value: 10)
        numbersTrain.append(value: 4)
        numbersTrain.append(value: 7)
        numbersTrain.append(value: 18)
        numbersTrain.append(value: 23)
        print("numbersTrain: \(numbersTrain)")
    }

}

