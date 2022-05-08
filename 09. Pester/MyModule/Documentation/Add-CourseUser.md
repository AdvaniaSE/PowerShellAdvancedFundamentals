---
external help file: MyModule-help.xml
Module Name: MyModule
online version:
schema: 2.0.0
---

# Add-CourseUser

## SYNOPSIS
Adds a user to the database

## SYNTAX

```
Add-CourseUser [[-DatabaseFile] <Object>] [-Name] <String> [-Age] <Int32> [-Color] <ColorEnum>
 [[-UserID] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Adds a user to the database

## EXAMPLES

### Example 1
```powershell
PS C:\> Add-CourseUser -Name "Björn Sundling" -Age 42 -Color 'Black' -ID 666
```

This command will add user Björn to the database

## PARAMETERS

### -Age
Age of user

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Color
The users favorite color

```yaml
Type: ColorEnum
Parameter Sets: (All)
Aliases:
Accepted values: red, green, blue, yellow

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DatabaseFile
The file that contains the user database

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the user to add

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserID
User ID of the user to add

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
