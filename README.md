# ServiceCommunication
func getUserData(){
var request = URLRequest(url: URL(string: "https://smart.wecambodia.com/testing/myReceipt/test/UserSetting/API.php")!)
            request.httpMethod = HTTPMethod.post.rawValue
            let dic = [
                "API_KEY":"MYRECEIPT_GETUSER",
                "REQ_DATA":
                    [
                        "id": 1
                ]
                ] as [String: AnyObject]
            let jsonString = try! JSON.dicToJSONString(dic)
            request.httpBody =  jsonString.data(using: String.Encoding.utf8)
    
            Alamofire.request(request).responseJSON { response in
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options: []) as! [String: Any]
                    print("json result \(jsonResult)")
                    if let rec = jsonResult["REC"] as? [AnyObject] {
                        for i in 0..<rec.count{
                            print(rec[i]["ID"] as! String)
                            print(rec[i]["USERNAME"] as! String)
                            print(rec[i]["PHONE"] as! String)
                            print(rec[i]["IMG_NAME"] as! String)
                            self.filename = rec[i]["IMG_NAME"] as! String
                            self.usrname = rec[i]["USERNAME"] as! String
                            self.phone = rec[i]["PHONE"] as! String
                            self.dob = rec[i]["DOB"] as! String
                            self.pass = rec[i]["PASSWORD"] as! String
    
                            //set data to label
                            self.usernameLabel.text = self.usrname
                            self.phoneLabel.text = self.phone
                            self.dobLabel.text = self.dob
    
    
                            let urlString = "https://smart.wecambodia.com/testing/myReceipt/image/\(self.filename.replacingOccurrences(of: " ", with: "", options: .literal, range: nil))!)"
                           
                            let url = URL(string:urlString)!
                            print("my url\(url)")
                            let resource = ImageResource(downloadURL: url, cacheKey: "image")
    
                            self.mainProfileImageView.kf.setImage(with: resource)
    
                        }
                    }
                } catch {
                    print("Failed to get data")
                }
            }
            
        }
