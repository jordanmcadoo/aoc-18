
func calculateChecksum(input: String) -> Int {
    let arr = createArray(input: input)
    var twoCount = 0
    var threeCount = 0
    arr.forEach { line in
        let result = checkIfTwoOrThree(line)
        if result.0 {
            twoCount += 1
        }
        if result.1 {
            threeCount += 1
        }
    }
    return twoCount * threeCount
}

func createArray(input: String) -> [String] {
    let split = input.split(separator: "\n")
    let strArr = split.map { line in
        String(line)
    }
    return strArr
}

func checkIfTwoOrThree(_ line: String) -> (Bool, Bool) {
    var charSet = Set<Character>()
    var twoOfChar = false
    var threeOfChar = false
    
    for char in line {
        guard !twoOfChar || !threeOfChar else { break }
        guard !charSet.contains(char) else { continue }
        
        var charCount = 0
        line.forEach { currentChar in
            if currentChar == char {
                charCount += 1
            }
        }
        
        if charCount == 2 {
            twoOfChar = true
        } else if charCount == 3 {
            threeOfChar = true
        }
        charSet.insert(char)
    }
    return (twoOfChar, threeOfChar)
}

let testInput =
"""
abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
"""

calculateChecksum(input: testInput) == 12

createArray(input: testInput) == ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"]

checkIfTwoOrThree("abcd") == (false, false)
checkIfTwoOrThree("aabb") == (true, false)
checkIfTwoOrThree("aaab") == (false, true)
checkIfTwoOrThree("aaabb") == (true, true)
