# performs the test of the module
Write-Host "##### PUSHING FILES TO S3 BUCKET ####"
aws s3 cp . aws s3 cp s3://server-standup-files-pluto-app/puppet_web_server/ --recursive