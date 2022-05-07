enum ColorEnum {
    red
    green
    blue
    yellow
}

class Participant {
    [string] $Name
    [int] $Age
    [ColorEnum] $Color 
    [int] $Id

    Participant([String]$Name, [int]$Age, [ColorEnum]$Color, [int]$Id) {
        $This.Name = $Name
        $This.Age = $Age
        $This.Color = $Color
        $This.Id = $Id
    }

    [string] ToString() {
        Return '{0},{1},{2},{3}' -f $This.Name, $This.Age, $This.Color, $This.Id
    }
}
