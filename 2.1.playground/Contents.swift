
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

let realInput =
"""
xrecqmdonskvzupalfkwhjctdb
xrlgqmavnskvzupalfiwhjctdb
xregqmyonskvzupalfiwhjpmdj
areyqmyonskvzupalfiwhjcidb
xregqpyonskvzuaalfiwhjctdy
xwegumyonskvzuphlfiwhjctdb
xregumymnskvzupalfiwhjctib
xregqmyonjkvzupalfvwijctdb
xrmgqmyonsdvzupalfiwhjcthb
xrpgqmyonskvzupalfiwhcitdb
xregvmysnsjvzupalfiwhjctdb
xregqsyonskvzupgqfiwhjctdb
qreuqmyonskvzupalfiwyjctdb
xrecqmyenskvzupalyiwhjctdb
xmegqmyonskvzhpalfcwhjctdb
xiegqmyonskvzupalfkwhjjtdb
xreaqmyofskfzupalfiwhjctdb
xregqmypnskvzupalmiwhjltdb
xretqmmonskvzupalfiwhwcfdb
xrexqmkonskvzupalfiwjjctdb
xrigqmyonskvgupplfiwhjctdb
xregqmyotskvzupalfywhjctdm
xcegmmyonsvvzupalfiwhjctdb
xrezqmypnskvznpalfiwhjctdb
xragqmyonskvzupblfiwajctdb
xregqmyonskvzwpapfiwhjctqb
xoegqmyoyskvzupaufiwhjctdb
xrcgqmyjnskvzupalfcwhjctdb
xregqmyonskvzudalfipajctdb
xsegqmyonsklzupalwiwhjctdb
xregqmyocskvduaalfiwhjctdb
xhegqmyfnskvzupalflwhjctdb
xregqmymnykvzupalfiwhjctdm
xregqmybnskvzupacfiwdjctdb
xaegqmlonskvzfpalfiwhjctdb
xoegtmyonskvzupalfiwhwctdb
xregqmyohskvzupaqfiwhjccdb
xoegqmyonstvzupalfiwhjctbb
mregnmyonskszupalfiwhjctdb
xreoqmycnskvzupalfiphjctdb
xregqmyocskvdupacfiwhjctdb
xregqmyonskvzupajqiahjctdb
xregqmyonslvwupalfiwhjcfdb
xregqmyonskvzapalfiwhqcthb
xrerqmyonskwzupalfiwhjctdt
xrefqmfonskvzupalfiwcjctdb
xregqmyonskvzupadfiwhjxedb
iregqhyonskvzupaliiwhjctdb
iregqmyotskvzucalfiwhjctdb
xrbgqmaonrkvzupalfiwhjctdb
xregqmyonskvzupalfixhdctdf
xrehqmyonskvzupalfiwijctdd
xvegqmyonskvzupaleuwhjctdb
xregqmyiyskvzupalfiwqjctdb
hregqmyonskvzupaxfiwhjptdb
xregamyznskbzupalfiwhjctdb
xreyqmyonskvgupalziwhjctdb
xregqmysnskvzupalfiwhgctdu
xojgqmyonskvzupalfiwbjctdb
xrkgqmyonskvlupalfiwhjcwdb
xregqmyonwkvxupalfiwajctdb
xregqmyonsuvzupalfjwhjcxdb
xregqmyonskgzucalfiwhjstdb
xaegqmyonfkvzupalfiwhjcttb
xlegqmyonskvzupazfiwhjctqb
xrejqmyonskvzqpaldiwhjctdb
xreguryonskvzupalfiwhjctdz
xregqsyoeskvzupalfiwhjctdt
xregqmyonskvzubalfirhjctdp
xrepqmymnskvzupadfiwhjctdb
xregqayonskvzuoalfichjctdb
xreqqmyonskvzunalfiwojctdb
xregqmyonsivzufalciwhjctdb
xregqqeonskvzupanfiwhjctdb
xoegqmyunskvzppalfiwhjctdb
xregqmyonskvzupalfqwhnftdb
xregqmyonskvzuralkiwhjcudb
xrwgqmymnskvzupalfiwhjcgdb
xvrgqmyonskvzupalfiwhjcthb
xregemyonskkzupalfiwhjctbb
xregqmyonsevzupalfiwhjjtdl
xregqmyonckvcupajfiwhjctdb
xregqmysnskvzunalfnwhjctdb
xreowmyonskvkupalfiwhjctdb
xregqmyonskvjupalfiwhjytdr
xregqmyonskyzupaffiwhmctdb
xrsgqmyonszvzupmlfiwhjctdb
xzegqmyonskvnupalfiwfjctdb
qregqmyonskvzupalfiwhrctjb
xpegqmyonsivzupqlfiwhjctdb
xregqmyoyskrzupalfiwhjctdx
xregqmyonsqvzupalfiwhjdndb
xregjmyonskvzppalfiwhjcgdb
xregqmyziskvzupalfiwhjctib
xregqmyonmkvbupalfiwhjckdb
xtegamyonskvzupalniwhjctdb
xregqpyonskvzhpwlfiwhjctdb
xvegqmfonskvzupalfiwhjcadb
xregqmyonskvzupaysiwhjctxb
xrejqmyonudvzupalfiwhjctdb
llegqmyonskvzbpalfiwhjctdb
tcegqmbonskvzupalfiwhjctdb
lregqmyohskvzupalfiwhjcttb
xrngqmcfnskvzupalfiwhjctdb
xregqmyonspvzuuplfiwhjctdb
xrxgqmyonslvzupalfiwhjctdo
xregqmyonskvzulalfuwhjdtdb
xregqmnonskvzupalfvwhjckdb
xregqbyfnskvzupaltiwhjctdb
xregqmyodsovzwpalfiwhjctdb
xregomyonskvhrpalfiwhjctdb
xregqmfdnskvzupalliwhjctdb
xregqmyonskvzupaabithjctdb
xrngamyonskvzupalfiwhjcttb
xrhgqmyonskvzupaldifhjctdb
xrygzmyonskvzupatfiwhjctdb
xregqmyonskvzupiqtiwhjctdb
xregqmyonfkvzupalfiwxjcsdb
xregqsyunskvzupalfiwhjctde
xrzgqmyolskvzupasfiwhjctdb
xgegqmyoyskvzupalfiwfjctdb
xrvgqlyohskvzupalfiwhjctdb
xregcmyonskvzuprlyiwhjctdb
xregqmyonskvwjpalfiwsjctdb
xrfgqmyonskvzupalfidhactdb
xcegqmyonwkvzdpalfiwhjctdb
nregqmyrnskvzupalciwhjctdb
xcegqmyonskvzvpalfiwhjctdj
xregqmyonskvzupqssiwhjctdb
xregcmyonskvzupalfinhjutdb
xregqmyonskvzupzlfiwcjctnb
xnegqmyozskvzbpalfiwhjctdb
xregvmponskvzupalfiwhsctdb
xregqmyonskvpupalqichjctdb
xreqqmyonskvzupauuiwhjctdb
xregqryonskvzupatfiwhjctyb
hregqmyonokvzupalfiwhmctdb
xreuqmionckvzupalfiwhjctdb
xregqmyoiskvzupanfiwhjntdb
xrdgqmronskvzupaluiwhjctdb
xadgqmyunskvzupalfiwhjctdb
eregqmzonskvzupakfiwhjctdb
xiegqmyonskvnupblfiwhjctdb
yregqmzonskvzupalfiwhjotdb
xregqmyonskvjupalfiwhjhtvb
wregqmyonskvzzprlfiwhjctdb
xregqmyovskvzupalgiuhjctdb
xregqmyonskjzupelfuwhjctdb
xregqmysuskvpupalfiwhjctdb
xrebqkyonskvzupalfiwpjctdb
xregcmyonskvzipalfiwhjcttb
xregqmyonskdyupalfiwgjctdb
xregcmyonskvzupalfiwijctnb
xregqmyonsovdupalfrwhjctdb
xregqmaonskvzupalnkwhjctdb
xregqmysnfkvzupalfiwhictdb
xregqmyonswvzupalfiyhjctdf
xreoqmyrnskvzupalfihhjctdb
tregqmydnskvzupalfizhjctdb
xregxmyonykvzupalfnwhjctdb
xzegqnyonskuzupalfiwhjctdb
xregqmfonszvvupalfiwhjctdb
xrerqmyjnskvzupalfiwhpctdb
xregqmyanskvzupalffphjctdb
rregqmyogskvzupalfiehjctdb
xrpgqmyonspvzupalfiwgjctdb
xuegqmppnskvzupalfiwhjctdb
xregqmyonskvzqpalsiwhjhtdb
xregqzyonskvzkpalfiwujctdb
xrdgqmyonskvzupglfiwhjctdu
xregqmyonskqzupahciwhjctdb
treqqmyonskvzupalfiwhjcqdb
vlegqmyonskvzupalfiwhjwtdb
xregjmyonskviupglfiwhjctdb
xreggmyanskvzupalfiwhjcydb
xregqmybnskvzuprlfiwhjmtdb
xrsgqmyonskizupagfiwhjctdb
xregqmyenskvzupalfvwhjctib
lrygqmyonsrvzupalfiwhjctdb
xregqmjonskvqupalfiwhjctdu
xregqmyonsknzmpzlfiwhjctdb
xregqmyonhkvzupllfiwhjctdz
xregqmronskvdumalfiwhjctdb
xrpgqmyonskvzupalfhwhjhtdb
xfegqmeonskvzupasfiwhjctdb
xregqqyonskvzrpalfiwijctdb
xretqmmonskvzupalfiwhjcfdb
xregqmyonskvznpalniwhjztdb
xregqmyqnskvzuoalfiwhhctdb
xregqmyonsbvzupalviwhjxtdb
xregqmyonskvzupazmiwhhctdb
xregqmyosskvzupalflwhjctdw
xtegqmyonskvzupamciwhjctdb
xregamyonskvzbpalfiwhqctdb
xregqmgonskvzupalfiwhictxb
xregqmyonskvjupvlfnwhjctdb
xrthqmyonskvzupalfiwhjctub
xrexqmyoyskvzupalfiwhjcadb
xvegqmyonskvxupalfiwhjztdb
xregqmyonskgzupalhiwhjptdb
xregqmysnskvzufalpiwhjctdb
xregqmyonskvbipalfighjctdb
xregqmyonskvzupylfiwhjwvdb
gregqmyonskvzupalfikhjctdt
ujegqmyonskvzupalfiwhjctlb
nreqqmyonskjzupalfiwhjctdb
xregqmyonskvzupanfbwhjchdb
xregqyyoeskwzupalfiwhjctdb
xregqmyokskvzgpalfiwhnctdb
lregqmyonskvzupalfawsjctdb
xtegqmyonskvzmpalfiwhjctmb
xtegqvyonskvzupalfiwhjdtdb
xpegqpyonekvzupalfiwhjctdb
qregqmyonskvzupalfiwmjctdn
xregqnyosskvzupalfibhjctdb
xregqmyonsknzupalflwhjctfb
xregqmxoyskvzuealfiwhjctdb
xregdmyoeskvzupalfiwhfctdb
xremmmyonskvzupalfiwhxctdb
xregqmconskvzupylfuwhjctdb
xregqmyonskvzupawiiwhictdb
xlegsmyonskvzupalfiwhbctdb
xregqmyonsavzopalyiwhjctdb
xregqmyonskczupalfibhvctdb
xregqmyonskvzvpalfiunjctdb
xregqmyonskvdupalfiwhjczdp
xregqmyonskvzupklfswhhctdb
xrelqmyonskvzupalyiwhjctdi
xrcgqmyonskvzupalfieqjctdb
xregqmnonskvzupacfewhjctdb
xrwgqmyonskvzuealfiwhcctdb
xregqiyonsevzmpalfiwhjctdb
xregqmyonjyvzupalfiwhjckdb
xregqmyonyklzupadfiwhjctdb
xregqmyanskvzupolfiwhjctpb
xdbgqmyonskvzupslfiwhjctdb
xregqmhonykvzupalfawhjctdb
xregqmqonsivzupalfifhjctdb
xregqgyonsrvzupalfiwhjctib
xregqmyofskvzupalfiwlfctdb
xregqmyovskvzupllftwhjctdb
xregqmyonskvzupaciiwhuctdb
xregqmyonsdvzuhalfiwhjhtdb
xreiqmyonskvzupalfiwhncldb
xregqmyongkvzugalfiwhjctxb
xregqsyonskvzrpmlfiwhjctdb
xrogqmyonskvzxpalfiwhbctdb
xregqmkonskvzuqalfiwhjptdb
xregqmyonskvvxpalfiwhactdb
xregqmyonskvzupsliiwhwctdb
"""

calculateChecksum(input: realInput)
