//
//  ViewController.swift
//  FoodTracker
//
//  Created by 耿楷寗 on 21/10/2017.
//  Copyright © 2017 EIE. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //We tell the ViewController class as the delegate of text field
    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    var meal:Meal?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Handle the text field's user input through delegate callbacks
        mealTextField.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
        if let meal = meal{
            navigationItem.title=meal.name
            mealTextField.text=meal.name
            photoImageView.image=meal.photo
            ratingControl.rating=meal.rating
        }
        updateSaveButtonState()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled=false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        mealTextField.resignFirstResponder()
        let imagePickerController=UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: {print("cancel")})
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image=selectImage
        dismiss(animated: true, completion: {print("select successfully")})
    }
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button===saveButton else{
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = mealTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        meal=Meal(name: name, photo: photo, rating:rating)
    }
    private func updateSaveButtonState(){
        let text=mealTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

