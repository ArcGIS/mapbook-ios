//
// Copyright 2017 Esri.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// For additional information, contact:
// Environmental Systems Research Institute, Inc.
// Attn: Contracts Dept
// 380 New York Street
// Redlands, California, USA 92373
//
// email: contracts@esri.com
//

enum AppMode: Int {
    case portal = 0, device
    
    private static let userDefaultsKey = "AppMode.UserDefaultsKey"
    
    func saveToUserDefaults() {
        UserDefaults.standard.set(self.rawValue, forKey: AppMode.userDefaultsKey)
    }
    
    static func retrieveFromUserDefaults() -> AppMode {
        let rawAppMode = UserDefaults.standard.integer(forKey: userDefaultsKey)
        return AppMode(rawValue: rawAppMode) ?? .portal
    }
}

extension AppMode {
    
    var noPackagesText: String {
        
        switch self {
        case .device:
            return "Add the mobile map package via iTunes.\n\nPull to refresh device loaded mobile map packages."
        case .portal:
            return "Tap the 'Portal MMPKs' button to download mobile map packages from portal.\n\nPull to refresh downloaded mobile map packages."
        }
    }
    
    var viewControllerTitle: String {
        switch self {
        case .portal:
            return "Downloaded Portal Mobile Map Packages"
        case .device:
            return "Device Mobile Map Packages"
        }
    }
}
