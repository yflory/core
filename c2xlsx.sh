echo '<?xml version="1.0" encoding="utf-8"?><TaskQueueDataConvert xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">' > c2xls-params.xml
echo "<m_sFileFrom>/core/$1</m_sFileFrom>" >> c2xls-params.xml
echo "<m_sFileTo>/core/$1.xlsx</m_sFileTo>" >> c2xls-params.xml
echo '<m_bIsNoBase64>false</m_bIsNoBase64>' >> c2xls-params.xml
echo '</TaskQueueDataConvert>' >> c2xls-params.xml
./x2t.sh c2xls-params.xml
