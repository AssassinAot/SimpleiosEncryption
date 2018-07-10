/*
 * MIT License
 *
 * Copyright (c) 2017 Kavin Varnan
 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import UIKit
import Foundation
//This just want to parse to JSON please use what ever you like
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let encryptedTextFromNodeJS = "+6OMoj9Xi0a42XFWHtboMAgNPRFv785ajCJ61qxjRLHsalZeyGueEn/yKuI5+Ar2KELz9csYnxcbUa/jRuVTHW616UrWI2/oMiOqXUy348fL6yFJFztdCu5wvf9AkkrMP1rcxF9bM4HaQP1HJ6fy25pOlcUf0EEYFuzz53Hal2s=";
        let encryptedTextFromAndroid = "1ZJxT2qKGPbbxUXXIDATh2DJ5f3+6A1dnowJodf69fYdEK1vNCAuoqh0q9zCvTCu6CJFyxnbvD3T/AEJXq9fTR4WWD8nCQf/Ia/NcrHj7DM="
        
        let exchangeKey = "dskmpadjosa";
        let plainText = "This is your What ever text or JSON Object Don't Forget to parse";
        
        let cryptLib = CryptLib()
        //Encrypt
        let cipherText = cryptLib.encryptPlainTextRandomIV(withPlainText: plainText, key: exchangeKey)
        print("cipherText===> \(cipherText! as String)")
        
        //Decrypt
        let decryptedString = cryptLib.decryptCipherTextRandomIV(withCipherText: encryptedTextFromNodeJS, key: exchangeKey)
        print("decryptedString===> \(decryptedString! as String)")
        let decryptedString1 = cryptLib.decryptCipherTextRandomIV(withCipherText: encryptedTextFromAndroid, key: exchangeKey)
        print("decryptedAndroidString===> \(decryptedString1! as String)")
        
        
        //this part just simple conversion to ios data type to print and see
        let data = decryptedString?.data(using: .utf8)
        struct MyObject: Codable
        {
            var xxx: Int?
            var yyy: Int?
            var zzz: Int?
        }
        let decoder = JSONDecoder()
        let results = try? decoder.decode([MyObject].self, from: data!) //Use Result.self here
        for res in results! {
            print("\t\(res.xxx) (\(res.yyy) yyy)  (\(res.zzz) zzz)")
        }
    }
    
}

