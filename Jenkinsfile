pipeline{
    environment{
        IMAGE_NAME = "website_album"
        IMAGE_TAG = "1.0.0"
        CONTAINER_NAME = "website_album"
    }
    agent none
    stages{
        stage('build_website'){
            agent any
            steps{
                script{
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }
        stage('test_website'){
            agent any
            steps{
                script{
                    sh """
                        docker rm -f ${CONTAINER_NAME} || true
                        docker run --name ${CONTAINER_NAME} -d -p 2500:80 -v /Image-Gallery/:/Image-Gallery ${IMAGE_NAME}:${IMAGE_TAG}
                        sleep 10
                        ls -l /Image-Gallery/
                        curl -s http://localhost:2500 | grep -o '<title>[^<]*</title>' | sed -e 's/<title>//g' -e 's/<\\/title>//g'
                    """
                }
            }
        }
    }
}