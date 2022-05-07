function Get-Duck {
$Duck = @'
              ,-.
          ,--' ~.).
        ,'         `.
       ; (((__   __)))
       ;  ( (#) ( (#)
       |   \_/___\_/|
      ,"  ,-'    `__".
     (   ( ._   ____`.)--._        _
      `._ `-.`-' \(`-'  _  `-. _,-' `-/`.
       ,')   `.`._))  ,' `.   `.  ,','  ;
     .'  .     `--'  /     ).   `.      ;
    ;     `-        /     '  )         ;
    \                       ')       ,'
     \                     ,'       ;
      \               `~~~'       ,'
       `.                      _,'
         `.                ,--'
           `-._________,--'

           §§§§
'@

    $qs = 'Are you sure?','Really?','Ok, and then?','Please, tell me more', 'what?!', 'and why is that?', 'quack quack, I´m a duck!', 'I see...', 'I dont believe you.'
    
    Clear-Host
    $Duck -replace '§§§§',$($qs | Get-Random)
    
    while ([console]::ReadKey().Key -ne [System.ConsoleKey]::Q) {
        Clear-Host
        $Duck -replace '§§§§',$($qs | Get-Random)
    }
}