//
//  Profile.swift
//  Capstone
//

import UIKit

struct Profile: Codable, Equatable {

    var name: String

    var bio: String?

    init(name: String, bio: String? = nil) {
        self.name = name
        self.bio = bio
    }

}

// MARK: - Profile + UserDefaults
extension Profile {
    static var profileKey: String {
        return "Profile"
    }

    static func save(_ profile: Profile, forKey key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(profile)
        defaults.set(encodedData, forKey: key)
    }

    static func getProfile() -> Profile {
        let defaults = UserDefaults.standard
        
        if let data = defaults.data(forKey: profileKey) {
            let decodedProfile = try! JSONDecoder().decode(Profile.self, from: data)
            return decodedProfile
        }
        else {
            return Profile(name: "Kenji225", bio: "Uhhhhhhhhhhhhhhhhhhh")
        }
    }

    func save() {
        let profile = Profile.getProfile()
        
        Profile.save(profile, forKey: Profile.profileKey)
    }
}
