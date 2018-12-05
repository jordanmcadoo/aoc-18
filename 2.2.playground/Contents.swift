func createArray(input: String) -> [String] {
    let split = input.split(separator: "\n")
    let strArr = split.map { line in
        String(line)
    }
    return strArr
}

func checkForAlmostMatch(current: String, input: [String]) -> String? {
    guard !input.isEmpty else { return nil }
    
    for line in input {
        var wrongChar = 0
        guard line.count == current.count else { continue }
        
        var matchingChars = ""
        for i in 0..<line.count {
            guard wrongChar < 2 else {
                matchingChars = ""
                break
            }
            let index1 = line.index(line.startIndex, offsetBy: i)
            let index2 = current.index(current.startIndex, offsetBy: i)
            if line[index1] != current[index2] {
                wrongChar += 1
            } else {
                matchingChars.append(line[index1])
            }
            
            if i == (line.count-1) && wrongChar < 2{
                return matchingChars
            }
        }
    }
    
    return nil
}


func calculateMatchingText(input: [String]) -> String? {
    guard let inputString = input.first else { return nil }
    let newArray = Array(input.dropFirst())
    if let matchingText = checkForAlmostMatch(current: inputString, input: newArray) {
        return matchingText
    } else {
        return calculateMatchingText(input: newArray)
    }
}

func createArrayAndGetAnswer(input: String) -> String {
    let array = createArray(input: input)
    return calculateMatchingText(input: array) ?? ""
}

checkForAlmostMatch(current: "abcdef", input: ["abcefg"]) == nil
checkForAlmostMatch(current: "abcdef", input: ["xbcdef"]) == "bcdef"

let testInput =
"""
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
"""

createArrayAndGetAnswer(input: testInput) == "fgij"

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

print(createArrayAndGetAnswer(input: realInput))
