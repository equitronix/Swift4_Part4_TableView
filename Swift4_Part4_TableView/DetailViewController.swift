//
//  DetailViewController.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 10/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate,
UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var imageStore: ImageStore!
    var item: AssetItem! {
        didSet{
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: Int(3600*5.5))
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func endEditing(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func nameChanged(_ sender: UITextField){
        navigationItem.title = nameField.text ?? ""
    }
    @IBAction func takePicture(_ sender: UIBarButtonItem){
        let imagePicker = UIImagePickerController();
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self;
        present(imagePicker, animated: true, completion: nil )
    }
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText){
            item.value = value.intValue;
        }else{
            item.value = 0;
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameField.text = item.name
        serialField.text = item.serialNumber
        //        valueField.text = "\(item.value)"
        //        dateLabel.text = "\(item.dateCreated)"
        
        valueField.text = numberFormatter.string(from: NSNumber(value: item.value))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        imageView.image = imageStore.getImage(forKey: item.imageKey)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    /*     MARK: - Navigation
     
     In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage;
        if let image = imageView.image{
            imageStore.setImage(forImage: image, forKey: item.imageKey)
        }
        dismiss(animated: true, completion: nil);
    }
    
}
