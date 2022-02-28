import Foundation

let ONE_MINUTE : UInt32 = 60_000_000

let stopFile = "./CIstop"

var lastGitHash = ""
var checkItAgain : Bool?

repeat {
    if let _ = checkItAgain {
        usleep(ONE_MINUTE)
    }
    let outputPipe = Pipe()
    let errorPipe = Pipe()

    let checkTask = Process()
    checkTask.executableURL = URL (fileURLWithPath: "/usr/bin/git")
    checkTask.standardOutput = outputPipe
    checkTask.standardError = errorPipe

    let myProject = "." // from repo: "https://github.com/bastie/broiler.git"
    checkTask.arguments = ["ls-remote", myProject, "refs/heads/main"]



    try checkTask.run()
    let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
    let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(decoding: outputData, as: UTF8.self)
    let _ = String(decoding: errorData, as: UTF8.self)

    let gitHash = output.components(separatedBy: .whitespacesAndNewlines)[0]
    switch gitHash {
    case lastGitHash: break
    default:
        let doTask = Process()
        doTask.executableURL = URL (fileURLWithPath: "./CIdoIt.exe")
        try doTask.run()
        lastGitHash = gitHash
    }
    
    if FileManager.default.fileExists(atPath: stopFile) {
        checkItAgain = false
    }
    else {
        checkItAgain = true
    }
    
}
while (checkItAgain!)

try FileManager.default.removeItem(atPath: stopFile)

