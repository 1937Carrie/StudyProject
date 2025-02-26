//
//  TimeViewController.swift
//  StudyProject
//
//  Created by Stanislav on 26.02.2025.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var labelTimeValue: UILabel!
    @IBOutlet weak var buttonGetTime: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func setOnButtonGetTimeClickListener(_ sender: UIButton) {
        let timeZone = "Europe/Amsterdam"
        let urlString = "https://timeapi.io/api/time/current/zone?timeZone=\(timeZone.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            labelTimeValue.text = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.labelTimeValue.text = "URLSession error"
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
            else {
                DispatchQueue.main.async {
                    self.labelTimeValue.text = "Invalid response"
                }
                return
            }


            do {
                if let data = data {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dateTime = json["dateTime"] as? String {
                        DispatchQueue.main.async {
                            self.labelTimeValue.text = dateTime
                        }
                        print("Response JSON: \(json)")
                    } else {
                        print("Invalid JSON format")
                    }
                }
            } catch {
                print("JSON parsing error: \(error)")
            }
        }
        task.resume()
    }

}
