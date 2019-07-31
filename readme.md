# Powershell Duplicate finder

Powershell to spin through a drive, build an md5 and then report on duplicates

Features to come:

* [x] Find best way to HASH files
* [ ] Find Entirely duplicated folders as well of files
* [ ] Stats on % of duplicates
* [ ] Top 10 Duplicates

## Test-Hashspeed.ps1
Used to find your fastest hashing algorithm.

| Switch                  | Description                                                                              |
|-------------------------|------------------------------------------------------------------------------------------|
| **justSuggest $true**   | will suppress the output table showing you actual times for each hash Algorithm.         |
| **numberAttempts nnn**  | will be the number of tries for each algorithm (this might be a long time on a big file) |
| **testFile <filename>** | is the file you wish to hash to test.                                                    |
 
### Example
``` 
.\Test - Hashspeed.ps1 - justSuggest $true - numberAttempts 200 - testFile C: /php/php.exe
```

