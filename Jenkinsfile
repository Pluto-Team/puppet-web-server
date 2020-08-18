pipeline {
    agent any
    // only keeps track of 5 builds at once
     options {
        buildDiscarder(logRotator(daysToKeepStr: '5', numToKeepStr: '5'))
    }

    stages {

        stage ("Starting Build") {
            steps{
                // slackSend (color: '#FFFF00', message: "STARTED Web Server puppet module lint checker: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                office365ConnectorSend  message: "STARTED Web Server puppet module lint checker: ${env.JOB_NAME} ${env.BUILD_NUMBER} ${env.BUILD_URL}", status: "Success", webhookUrl: env.TEAMS_WEBOOK_URL
            }
        }

        stage( "Push module to S3" ) {
            steps {
                sh 'pwsh push-to-s3.ps1'
            }
        }

        // clean up the workspace
       stage( "Clean Up" ) {
            steps {
                sh 'rm -rf *'
            }
        }

    } // end of stages

    // after completing all of the stage tasks above, it will send an email if there was failure or success
    post {
        success {
            // slackSend (color: '#00FF00', message: "Web Server puppet module lint checker SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            office365ConnectorSend  message: "Web Server puppet module lint checker SUCCESSFUL: Job ${env.JOB_NAME} ${env.BUILD_NUMBER} ${env.BUILD_URL}", status: "Success", webhookUrl: env.TEAMS_WEBOOK_URL
        }

        failure {
            // slackSend (color: '#FF0000', message: "Web Server puppet module lint checker FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            office365ConnectorSend  message: "Web Server puppet module lint checker FAILED: Job ${env.JOB_NAME} ${env.BUILD_NUMBER} ${env.BUILD_URL}", status: "Failed", webhookUrl: env.TEAMS_WEBOOK_URL

            
        }

    } // end of post

} // end of pipelines