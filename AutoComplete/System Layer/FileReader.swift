import Foundation

class FileReader: DataReader {
    func Read(url: URL) throws -> [String] {
        let data = try String(contentsOf: url, encoding: .utf8)
        return data.components(separatedBy: .newlines)
    }
}
