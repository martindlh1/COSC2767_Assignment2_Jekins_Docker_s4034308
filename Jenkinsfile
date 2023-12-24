pipeline {
    agent any

    tools {
        maven "Maven"
        git "Git"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/martindlh1/COSC2767_Assignment2_Jekins_Docker_s4034308'

                // Run Maven on a Unix agent.
                sh "mvn clean install"
            }
        }
        stage('Post build') {
        steps([$class: 'BapSshPromotionPublisherPlugin']) {
            sshPublisher(
                continueOnError: false, failOnError: true,
                publishers: [
                    sshPublisherDesc(
                        configName: "tomcat-server",
                        verbose: true,
                        transfers: [
                            sshTransfer(
                                execCommand: "cd /home/dockeradmin;docker pull martindlh/tomcat-image:latest;docker stop tomcat-container;docker rm tomcat-container;docker run -d --name tomcat-container -p 8080:8080 martindlh/tomcat-image",
                                sourceFiles: "target/*.war",
                                removePrefix: "target"
                                )
                        ]
                    )
                ]
            )
        }
    }
    }
}
