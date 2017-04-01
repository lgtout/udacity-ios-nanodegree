import Cocoa

func shortNameFromName(_ name: String) -> String {
    let name = name.lowercased()
    let cs = CharacterSet(charactersIn: "aeiou\u{00f6}")
    var shortName:String = name
    if let r = name.rangeOfCharacter(from: cs) {
        shortName = name.substring(from:(r.lowerBound))
    }
    return shortName
}

//shortNameFromName("Nate")
//shortNameFromName("Böse")
shortNameFromName("Bsk")

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName:String) -> String {
    let lyrics =
        lyricsTemplate.replacingOccurrences(
            of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(
                of: "<SHORT_NAME>",
                with: shortNameFromName(fullName))
    return lyrics
}

print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate"))
