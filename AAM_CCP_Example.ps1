$AppId = 'AAM_CCP_EXAMPLE_APP'
$safe = 'AAM_CCP_EXAMPLE_SAFE'
$folder = 'Root'
$object = 'aam-ccp-example-objectname'
 
$uri = 'https://cyberarkccp.company.com/AIMWebservice/v1.1/AIM.asmx'
 
$response = Invoke-WebRequest -Uri $uri -Method Post -Body "<?xml version='1.0' encoding='utf-8'?>
<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>
  <soap:Body>
    <GetPassword xmlns='https://tempuri.org/'>
      <passwordWSRequest>
        <AppID>$AppId</AppID>
        <Safe>$safe</Safe>
        <Folder>$folder</Folder>
        <Object>$object</Object>
      </passwordWSRequest>
    </GetPassword>
  </soap:Body>
</soap:Envelope>" -ContentType 'text/xml'
 
$xmlContent = [xml]($response.Content )
write-host $xmlContent.Envelope.Body.GetPasswordResponse.GetPasswordResult.Content