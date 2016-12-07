//
//  NewTicketController.swift
//  HelpSumoSDK
//
//  Created by APP DEVELOPEMENT on 28/11/16.
//  Copyright © 2016 APP DEVELOPEMENT. All rights reserved.
//

import UIKit

class NewTicketController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var nameHeight: NSLayoutConstraint!
    
    @IBOutlet weak var txtNameHeight: NSLayoutConstraint!
    
    @IBOutlet weak var emailHeight: NSLayoutConstraint!
    
    @IBOutlet weak var txtEmailHeight: NSLayoutConstraint!
    
    @IBOutlet weak var departmentDropDown: UIButton!
    
    @IBAction func onDepartmentSelected(_ sender: UIButton) {
        if self.depDropDown.isHidden {
            self.depDropDown.show()
        } else {
            self.depDropDown.hide()
        }
    }
    
    @IBOutlet weak var priorityDropDown: UIButton!

    @IBAction func onPrioritySelected(_ sender: UIButton) {
        if self.priorDropDown.isHidden {
            self.priorDropDown.show()
        } else {
            self.priorDropDown.hide()
        }
    }
    
    @IBOutlet weak var typeDropDown: UIButton!
    
    
    @IBAction func onTypeSelected(_ sender: UIButton) {
        if self.typDropDown.isHidden {
            self.typDropDown.show()
        } else {
            self.typDropDown.hide()
        }
    }
    
    @IBOutlet weak var ticketMessage: UITextView!
    
    @IBAction func onUploadImagePressed(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtSubject: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        
        
        let defaults = UserDefaults.standard
        
        let userID = defaults.value(forKey: "userID")
        
        if (userID == nil)
        {
        
        if (!txtName.isHidden)
        {
            if (txtName.text?.isEmpty)!
            {
                let alertController:UIAlertController? = UIAlertController(title: "",
                                                                           message: "Please enter your name",
                                                                           preferredStyle: .alert)
                
                let alertAction = UIAlertAction(title: "Okay",style: .default,
                                                handler:nil)
                
                alertController!.addAction(alertAction)
                
                OperationQueue.main.addOperation {
                    self.present(alertController!,animated: true, completion: nil)
                    
                    return
                    
                }
            }
        }
        
        if (!txtEmail.isHidden)
        {
            if (txtEmail.text?.isEmpty)! || !self.isValidEmail(testStr: txtEmail.text!)
            {
                let alertController:UIAlertController? = UIAlertController(title: "",
                                                                           message: "Please enter a valid email address",
                                                                           preferredStyle: .alert)
                
                let alertAction = UIAlertAction(title: "Okay",style: .default,
                                                handler:nil)
                
                alertController!.addAction(alertAction)
                
                OperationQueue.main.addOperation {
                    self.present(alertController!,animated: true, completion: nil)
                    
                    return
                    
                }
            }
        }
            
        }
        
        if (txtSubject.text?.isEmpty)!
        {
            let alertController:UIAlertController? = UIAlertController(title: "",
                                                                       message: "Please enter the subject",
                                                                       preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Okay",style: .default,
                                            handler:nil)
            
            alertController!.addAction(alertAction)
            
            OperationQueue.main.addOperation {
                self.present(alertController!,animated: true, completion: nil)
                
                return
                
            }
        }
        
        if (ticketMessage.text.isEmpty)
        {
            let alertController:UIAlertController? = UIAlertController(title: "",
                                                                       message: "Please enter the ticket message",
                                                                       preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Okay",style: .default,
                                            handler:nil)
            
            alertController!.addAction(alertAction)
            
            OperationQueue.main.addOperation {
                self.present(alertController!,animated: true, completion: nil)
                
                return
                
            }
        }
        
        if departmentDropDown.currentTitle! == "Please select"
        {
            let alertController:UIAlertController? = UIAlertController(title: "",
                                                                       message: "Please select the department",
                                                                       preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Okay",style: .default,
                                            handler:nil)
            
            alertController!.addAction(alertAction)
            
            OperationQueue.main.addOperation {
                self.present(alertController!,animated: true, completion: nil)
                
                return
                
            }
        }
        
        if priorityDropDown.currentTitle! == "Please select"
        {
            let alertController:UIAlertController? = UIAlertController(title: "",
                                                                       message: "Please select ticket priority",
                                                                       preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Okay",style: .default,
                                            handler:nil)
            
            alertController!.addAction(alertAction)
            
            OperationQueue.main.addOperation {
                self.present(alertController!,animated: true, completion: nil)
                
                return
                
            }
        }
        
        if typeDropDown.currentTitle! == "Please select"
        {
            let alertController:UIAlertController? = UIAlertController(title: "",
                                                                       message: "Please select ticket type",
                                                                       preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Okay",style: .default,
                                            handler:nil)
            
            alertController!.addAction(alertAction)
            
            OperationQueue.main.addOperation {
                self.present(alertController!,animated: true, completion: nil)
                
                return
                
            }
        }
        
        if (!txtName.isHidden)
        {
            self.AddTicket(requesterName: txtName.text!, emailID: txtEmail.text!,subject: txtSubject.text!, message: ticketMessage.text!,departmentID: selectedDepartmentID,priorityID: selectedPriorityID,typeID: selectedTypeID) {
                results in
            
            
                if ((self.imageView.image) != nil)
                {
                    print("Image Upload")
                    self.myImageUploadRequest(ImageFile: self.imageView.image!)
                }
                print("View Controller: \(results)")
            }
        }
        else
        {
            self.AddTicket(requesterName: defaults.value(forKey: "userName") as! String, emailID: defaults.value(forKey: "userMail") as! String,subject: txtSubject.text!, message: ticketMessage.text!,departmentID: selectedDepartmentID,priorityID: selectedPriorityID,typeID: selectedTypeID) {
                results in
                
                
                if ((self.imageView.image) != nil)
                {
                    print("Image Upload")
                    self.myImageUploadRequest(ImageFile: self.imageView.image!)
                }
                print("View Controller: \(results)")
            }
        
        }
    
        
    }
    
    
    let depDropDown = DropDown()
    
    let priorDropDown = DropDown()

    let typDropDown = DropDown()
    
    var departmentArray = [String]()
    
    var departmentIDArray = [String]()
    
    var selectedDepartmentID : String = ""
    
    var priorityArray = [String]()
    
    var priorityIDArray = [String]()
    
    var selectedPriorityID : String = ""

    var typeArray = [String]()
    
    var typeIDArray = [String]()
    
    var selectedTypeID : String = ""
    
    var newTicketID : String = ""
    
    var newTicketNumber : String = ""

    let imagePicker = UIImagePickerController()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = self.view.bounds.size
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Create Ticket"
        
        ticketMessage.layer.borderColor = UIColor(red: CGFloat(204.0 / 255.0), green: CGFloat(204.0 / 255.0), blue: CGFloat(204.0 / 255.0), alpha: CGFloat(1.0)).cgColor
        ticketMessage.layer.borderWidth = 1.0
        ticketMessage.layer.cornerRadius = 5
        
        imagePicker.delegate = self
        
        let defaults = UserDefaults.standard
        
        let userID = defaults.value(forKey: "userID")
        
        if (userID != nil)
        {
            txtName.isHidden = true
            txtEmail.isHidden = true
            nameHeight.priority = 1000
            txtNameHeight.priority = 1000
            emailHeight.priority = 1000
            txtEmailHeight.priority = 1000
        }
        
        
        self.scrollView.isScrollEnabled = true
        self.scrollView.frame = self.view.bounds
        //self.scrollView.contentSize = self.view.bounds.size
        
        self.loadDropdownData(){
            results in
            print("View Controller: \(results)")
        }


        self.depDropDown.anchorView = departmentDropDown
        
        self.depDropDown.selectionAction = { [unowned self] (index, item) in
            self.selectedDepartmentID = self.departmentIDArray[index]
            self.departmentDropDown.setTitle(item, for: .normal)
        }
        
        self.priorDropDown.anchorView = priorityDropDown
        
        //self.priorDropDown.dataSource = ["Normal", "High", "Very High"]
        
        self.priorDropDown.selectionAction = { [unowned self] (index, item) in
            self.selectedPriorityID = self.priorityIDArray[index]
            self.priorityDropDown.setTitle(item, for: .normal)
        }
        
        self.typDropDown.anchorView = typeDropDown
        
        //self.typDropDown.dataSource = ["Question", "Bug", "customisation"]
        
        self.typDropDown.selectionAction = { [unowned self] (index, item) in
            self.selectedTypeID = self.typeIDArray[index]
            print(self.selectedTypeID)
            self.typeDropDown.setTitle(item, for: .normal)
        }
 
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDropdownData(completionHandler: @escaping (_ results: String) -> ())
    {
        
        let defaultSession = URLSession(configuration: URLSessionConfiguration.ephemeral)
        
        let constants = Constants()
        
        
        let url = URL(string: constants.AppUrl+"ticketlookup")!
        var request = URLRequest(url: url)
        request.addValue("text/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        let jsonObject: [String: String] = [
            "apikey":constants.APIKey,
        ]
        
        var data : AnyObject
        
        let dict = jsonObject as NSDictionary
        do
        {
            
            data = try JSONSerialization.data(withJSONObject: dict, options:.prettyPrinted) as AnyObject
            
            
            let strData = NSString(data: (data as! NSData) as Data, encoding: String.Encoding.utf8.rawValue)! as String
            
            print(strData)
            
            data = strData.data(using: String.Encoding.utf8)! as AnyObject
            
            
            
            let task = defaultSession.uploadTask(with: request, from: (data as! NSData) as Data, completionHandler:
                {(data,response,error) in
                    
                    guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                        
                        
                        
                        let alertController:UIAlertController? = UIAlertController(title: "",
                                                                                   message: "Error in Registration",
                                                                                   preferredStyle: .alert)
                        
                        let alertAction = UIAlertAction(title: "Okay",style: .default,
                                                        handler:nil)
                        
                        alertController!.addAction(alertAction)
                        
                        
                        //self.presentViewController(alertController!,animated: true, completion: nil)
                        
                        
                        return
                    }
                    
                    let json = JSON(data: data!)
                    
                    print(json["tickettype"])
                    
                    for i in 0..<json["department"].count
                    {
                        
                        self.departmentArray.append(String(describing: json["department"][i]["department_name"]))
                        
                        self.departmentIDArray.append(String(describing: json["department"][i]["department_id"]))
                    }
                    
                    self.depDropDown.dataSource = self.departmentArray
                    
                    for i in 0..<json["priority"].count
                    {
                        
                        self.priorityArray.append(String(describing: json["priority"][i]["priority_name"]))
                        
                        self.priorityIDArray.append(String(describing: json["priority"][i]["id"]))
                    }
                    
                    
                    self.priorDropDown.dataSource = self.priorityArray
                    
                    for i in 0..<json["tickettype"].count
                    {
                        
                        self.typeArray.append(String(describing: json["tickettype"][i]["type_name"]))
                        
                        self.typeIDArray.append(String(describing: json["tickettype"][i]["ticket_type_id"]))
                    }
                    
                    
                    self.typDropDown.dataSource = self.typeArray
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    
                    
                    completionHandler(dataString as! String)
            }
            );
            task.resume()
            
            
            
        }catch{
            
        }

    }
    
    func AddTicket(requesterName: String,emailID: String,subject: String,message: String,departmentID: String,priorityID: String,typeID: String,completionHandler: @escaping (_ results: String) -> ())
    {
        
        let defaultSession = URLSession(configuration: URLSessionConfiguration.ephemeral)
        
        let constants = Constants()
        
        
        let url = URL(string: constants.AppUrl+"ticket")!
        var request = URLRequest(url: url)
        request.addValue("text/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        let jsonObject: [String: String] = [
            "apikey":constants.APIKey,
            "requestername": requesterName,
            "email": emailID,
            "subject": subject,
            "message": message,
            "action":"add",
            "ticket_type_id": typeID,
            "ticket_priority_id": priorityID,
            "assign_department_id": departmentID
        ]
        
        var data : AnyObject
        
        let dict = jsonObject as NSDictionary
        do
        {
            
            data = try JSONSerialization.data(withJSONObject: dict, options:.prettyPrinted) as AnyObject
            
            
            let strData = NSString(data: (data as! NSData) as Data, encoding: String.Encoding.utf8.rawValue)! as String
            
            print(strData)
            
            data = strData.data(using: String.Encoding.utf8)! as AnyObject
            
            
            
            let task = defaultSession.uploadTask(with: request, from: (data as! NSData) as Data, completionHandler:
                {(data,response,error) in
                    
                    guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                        
                        
                        
                        let alertController:UIAlertController? = UIAlertController(title: "",
                                                                                   message: "Error in Registration",
                                                                                   preferredStyle: .alert)
                        
                        let alertAction = UIAlertAction(title: "Okay",style: .default,
                                                        handler:nil)
                        
                        alertController!.addAction(alertAction)
                        
                        
                        //self.presentViewController(alertController!,animated: true, completion: nil)
                        
                        
                        return
                    }
                    
                    let json = JSON(data: data!)
                    
                    print(json)
                    
                    let defaults = UserDefaults.standard
                    
                    let userID = String(describing: json["response"]["user"]["user_id"])
                    
                    self.newTicketID = String(describing: json["response"]["ticket"]["ticket_id"])
                    
                    self.newTicketNumber = String(describing: json["response"]["ticket"]["ticket_no"])
                    
                    print("UserID "+userID)
                    
                    print("Ticket ID"+self.newTicketID)
                    
                    print("Ticket No."+self.newTicketNumber)
                    
                    if (!userID.isEmpty && userID != "null" )
                    {
                        print("User ID saved")
                        defaults.set(userID, forKey: "userID")
                        
                        
                    }
                    
                    if (!self.txtName.isHidden)
                    {
                        defaults.set(self.txtName.text, forKey: "userName")
                        defaults.set(self.txtEmail.text, forKey: "userMail")
                    }
                    
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    
                    
                    completionHandler(dataString as! String)
            }
            );
            task.resume()
            
            
            
        }catch{
            
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func myImageUploadRequest(ImageFile: UIImage)
    {
        let constants = Constants()
        let myUrl = NSURL(string: constants.AppUrl+"ticketattachment");
        
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "POST";
        
        let param = [
            "apikey": constants.APIKey,
            "ticket_no": self.newTicketNumber,
            "ticket_id": self.newTicketID
        ]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let imageData = UIImageJPEGRepresentation(ImageFile, 1)
        
        //var imageData = CIImage(image: ImageFile)
        
        if(imageData==nil)  { return; }
        
        request.httpBody = createBodyWithParameters(parameters: param, filePathKey: "file", imageDataKey: imageData! as NSData, boundary: boundary) as Data
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("******* response = \(response)")
            
            // Print out reponse body
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("****** response data = \(responseString!)")
            
            
        }
        
        task.resume()
        
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        var body = NSMutableData();
        
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        
        let filename = "file"
        
        let mimetype = "image/jpg"
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append(imageDataKey as Data)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        
        return body
    }
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
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
