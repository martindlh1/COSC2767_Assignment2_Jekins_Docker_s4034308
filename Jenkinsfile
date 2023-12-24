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
                git branch: 'main', url: 'https://github.com/martindlh1/cosc2767-assignment2-website.git'

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
                                execCommand: "cd /home/dockeradmin;docker build -t tomcat-image .;docker stop tomcat-container;docker rm tomcat-container;docker run -d --name tomcat-container -p 8081:8080 tomcat-image",
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
