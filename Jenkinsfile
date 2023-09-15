pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code Git
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image from Dockerfile
              sh 'docker build -t httpd:2.4 .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image
              sh "docker run -dit -p 8089:80 --name notbad_web httpd:2.4 -v /var/lib/jenkins/workspace/test_main/index.html:/usr/local/apache2/htdocs/"
                }
            }
    }

}

