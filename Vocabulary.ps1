$Vocabulary = $null
$Vocabulary = [ordered]@{}
Function LoadVocabulary
{
    $VocabularyFile = Import-Csv /Volumes/Data/Powershell/Words.csv -Delimiter ';'

    for ($i=2; $i -lt $VocabularyFile.Length; $i++)
    {
        $Slovak = @()
        $English = $VocabularyFile[$i].English
        $Slovak += $VocabularyFile[$i].SK1
        if ($VocabularyFile[$i].SK2 -ne '')
        {
            $Slovak += $VocabularyFile[$i].SK2
        }

        if ($VocabularyFile[$i].SK3 -ne '')
        {
            $Slovak += $VocabularyFile[$i].SK3
        }

        if ($VocabularyFile[$i].SK4 -ne '')
        {
            $Slovak += $VocabularyFile[$i].SK4
        }
        $Vocabulary.Add($English,$Slovak)
    }
}
Function TestVocabulary
{
    foreach ($Word in $Vocabulary.GetEnumerator())
    {
        Clear-Host
        $Answer = Read-Host -Prompt $Word.Key
        if ($Word.Value.Contains($Answer)) {
            Write-Host "Spravne! Dalsie moznosti: " $Word.Value
        }
        else {
           Write-Host "Nespravne! Spravne:  " $Word.Value
        }
        Pause 1
    }
}

LoadVocabulary
TestVocabulary