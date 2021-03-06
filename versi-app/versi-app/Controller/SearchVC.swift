//
//  SearchVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/23/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import Speech
import Clarifai
import PopupDialog

class SearchVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var microphoneButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var uploadImageBtn: UIButton!
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    var longGesture: UIGestureRecognizer?
    
    var app:ClarifaiApp?
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //api key for fashion detection
        app = ClarifaiApp(apiKey: "38e92484139744298a6fea788039ce8a")
      
        
        
        microphoneButton.isEnabled = false

        speechRecognizer.delegate = self as? SFSpeechRecognizerDelegate
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            var isButtonEnabled = false
            
            switch authStatus {
            case .authorized:
                isButtonEnabled = true
                
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")
                
            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            }
            
            OperationQueue.main.addOperation() {
                self.microphoneButton.isEnabled = isButtonEnabled
            }
        }

    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        searchBar.resignFirstResponder()
    }
    
    
    @objc func longTap(_ sender: UIGestureRecognizer){
        
        if sender.state == .ended {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            microphoneButton.isEnabled = false
        }
        else if sender.state == .began {
            startRecording()
        }
    }

    
    
    func startRecording() {
        self.searchBar.text = ""

        if recognitionTask != nil {  //1
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()  //2
        do {
            //try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()  //3
        
        let inputNode = audioEngine.inputNode  //4
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        } //5
        
        recognitionRequest.shouldReportPartialResults = true  //6
        
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in  //7
            
            var isFinal = false  //8
            
            if result != nil {
                
                self.searchBar.text = result?.bestTranscription.formattedString //9
                isFinal = (result?.isFinal)!
                
            }
            
            if error != nil || isFinal {  //10
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.microphoneButton.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)  //11
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()  //12
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        searchBar.placeholder = "Say something, I'm listening!"
        //self.searchBar.text = "Say something, I'm listening!"
        
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            microphoneButton.isEnabled = true
        } else {
            microphoneButton.isEnabled = false
        }
    }
    
    @IBAction func uploadImageBtnPressed(_ sender: Any) {
        let popup = PopupDialog(title: "", message: "")
        let buttonOne = DefaultButton(title: "Use a Camera") {
            self.picker.sourceType = UIImagePickerController.SourceType.camera
            self.picker.delegate = self;
            self.present(self.picker, animated: true, completion: nil)
        }
        let buttonTwo = DefaultButton(title: "Choose from photoes") {
            self.picker.allowsEditing = true;
            self.picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.picker.delegate = self;
            self.present(self.picker, animated: true, completion: nil)
        }
        let buttonThree = CancelButton(title: "Cancel") {}
        popup.addButtons([buttonOne, buttonTwo, buttonThree])
        self.present(popup, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // The user picked an image. Send it to Clarifai for recognition.
            dismiss(animated: true, completion: nil)
            if let image = info[.originalImage] as? UIImage {
                //UIImageView.image = image
                recognizeImage(image: image)
                //UITextView.text = "Recognizing..."
                //button.isEnabled = false
            }
        }
    
        func recognizeImage(image: UIImage) {
    
            // Check that the application was initialized correctly.
            if let app = app {
    
                // Fetch Clarifai's general model.
                app.getModelByName("general-v1.3", completion: { (model, error) in
    
                    // Create a Clarifai image from a uiimage.
                    let caiImage = ClarifaiImage(image: image)!
    
                    // Use Clarifai's general model to pedict tags for the given image.
                    model?.predict(on: [caiImage], completion: { (outputs, error) in
                        print("%@", error ?? "no error")
                        guard
                            let caiOuputs = outputs
                            else {
                                print("Predict failed")
                                return
                        }
    
                        if let caiOutput = caiOuputs.first {
                            // Loop through predicted concepts (tags), and display them on the screen.
                            let tags = NSMutableArray()
                            for concept in caiOutput.concepts {
                                tags.add(concept.conceptName)
                            }
    
                            DispatchQueue.main.async {
                                // Update the new tags in the UI.
                                let khara = String(format: "Tags:\n%@", tags.componentsJoined(by: ", "))
                                print(khara)
                                self.searchBar.text = tags[2] as? String
                                //call api's for all keywords
                            }
                        }
    
                        DispatchQueue.main.async {
                            // Reset select photo button for multiple selections.
                            //self.button.isEnabled = true;
                        }
                    })
                })
            }
        }
}

