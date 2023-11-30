// The Swift Programming Language
// https://docs.swift.org/swift-book

public enum Holidays {
    
}
extension Holidays {
    static func to_correct_capitalization(input: String, excluded_words: Set<Substring> = []) -> String {
        let values:[Substring] = input.split(separator: "_")
        return values.map({ value in
            guard !excluded_words.contains(value) else { return input.starts(with: value) ? capitalize(value) : value }
            return capitalize(value)
        }).joined(separator: " ")
    }
    private static func capitalize(_ string: Substring) -> Substring {
        return string.first!.uppercased() + string.suffix(string.count - 1)
    }
}
