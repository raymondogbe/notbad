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
              sh "docker run -dit -p 8089:80 --name notbad_web httpd:2.4"
                //-v /var/lib/jenkins/workspace/test_main/index.html:/usr/local/apache2/htdocs/"
                }
            }
        stage('Test your connection') {
            steps {
                script {
                    def url = 'http://54.177.37.216:8089/'
                    def response = sh(script: "curl -s -o /dev/null -w '%{http_code}' $url", returnStatus: true).trim()
                    if (response == '200') {
                        echo "HTTP connection to $url is successful. Status code: $response"
                    } else {
                        error "HTTP connection to $url failed. Status code: $response"
                    }
                }
            }
        }
        
        
        stage('Deploy app to Production Container') {
            steps {
                //input "Copy the index.html to docker container?"
                //milestone(1)
              sh "docker cp /var/lib/jenkins/workspace/test_main/index.html notbad_web:/usr/local/apache2/htdocs/"
                //-v /var/lib/jenkins/workspace/test_main/index.html:/usr/local/apache2/htdocs/"
                }
            }
        
    }

}


