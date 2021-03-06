/*
*     Copyright 2015 IBM Corp.
*     Licensed under the Apache License, Version 2.0 (the "License");
*     you may not use this file except in compliance with the License.
*     You may obtain a copy of the License at
*     http://www.apache.org/licenses/LICENSE-2.0
*     Unless required by applicable law or agreed to in writing, software
*     distributed under the License is distributed on an "AS IS" BASIS,
*     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*     See the License for the specific language governing permissions and
*     limitations under the License.
*/

/// This class represents the base app identity class, with default methods and keys
public class BaseAppIdentity : AppIdentity{

    public static let ID = "id"

    public static let VERSION = "version"
    
    public internal(set) var jsonData : [String:String] = ([:])
    
	public var id:String? {
		get{
			return jsonData[BaseAppIdentity.ID]
		}
	}
	public var version:String? {
		get{
			return jsonData[BaseAppIdentity.VERSION]
		}
	}
	
	public init() {
        
        #if swift(>=3.0)
            jsonData[BaseAppIdentity.ID] = Bundle(for:object_getClass(self)).bundleIdentifier;
            jsonData[BaseAppIdentity.VERSION] = Bundle.main().infoDictionary?["CFBundleShortVersionString"] as? String;
        #else
            jsonData[BaseAppIdentity.ID] = NSBundle(forClass:object_getClass(self)).bundleIdentifier;
            jsonData[BaseAppIdentity.VERSION] = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String;
        #endif
        
	}
	
    public init(map: [String:AnyObject]?) {
        guard let json = map as? [String:String] else {
            jsonData = ([:])
            return
        }

        jsonData = json
    }

}
