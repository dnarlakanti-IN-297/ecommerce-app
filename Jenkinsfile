pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDS = credentials('dockerhub-token')
        DOCKER_HUB_REPO = 'dnarlakanti'
        GIT_COMMIT_SHA = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
        INFRA_REPO = 'git@github.com:dnarlakanti-IN-297/ecommerce-infra.git'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📦 Checking out code...'
                checkout scm
            }
        }

        stage('Run Tests') {
            steps {
                echo '🧪 Running tests...'
                dir('backend') {
                    sh '''
                        python3 -m venv venv
                        . venv/bin/activate
                        pip install -r requirements.txt
                        pytest tests/ --junit-xml=../test-results.xml || true
                    '''
                }
            }
            post {
                always {
                    junit '**/test-results.xml'
                }
            }
        }

        stage('Build Docker Images') {
            parallel {
                stage('Build Frontend') {
                    steps {
                        echo '🏗️  Building frontend image...'
                        dir('frontend') {
                            sh """
                                docker build -t ${DOCKER_HUB_REPO}/ecommerce-frontend:${GIT_COMMIT_SHA} .
                                docker tag ${DOCKER_HUB_REPO}/ecommerce-frontend:${GIT_COMMIT_SHA} ${DOCKER_HUB_REPO}/ecommerce-frontend:latest
                            """
                        }
                    }
                }
                stage('Build Backend') {
                    steps {
                        echo '🏗️  Building backend image...'
                        dir('backend') {
                            sh """
                                docker build -t ${DOCKER_HUB_REPO}/ecommerce-backend:${GIT_COMMIT_SHA} .
                                docker tag ${DOCKER_HUB_REPO}/ecommerce-backend:${GIT_COMMIT_SHA} ${DOCKER_HUB_REPO}/ecommerce-backend:latest
                            """
                        }
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo '📤 Pushing images to Docker Hub...'
                sh '''
                    echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin
                '''
                sh """
                    docker push ${DOCKER_HUB_REPO}/ecommerce-frontend:${GIT_COMMIT_SHA}
                    docker push ${DOCKER_HUB_REPO}/ecommerce-frontend:latest
                    docker push ${DOCKER_HUB_REPO}/ecommerce-backend:${GIT_COMMIT_SHA}
                    docker push ${DOCKER_HUB_REPO}/ecommerce-backend:latest
                """
            }
        }

        stage('Update Helm Charts') {
            steps {
                echo '📝 Updating Helm charts with new image tags...'
                sh '''
                    git clone ${INFRA_REPO} infra-repo || true
                    cd infra-repo

                    # Update frontend image tag
                    sed -i "s|tag:.*# frontend|tag: ${GIT_COMMIT_SHA} # frontend|g" helm/ecommerce/values.yaml

                    # Update backend image tag
                    sed -i "s|tag:.*# backend|tag: ${GIT_COMMIT_SHA} # backend|g" helm/ecommerce/values.yaml

                    git config user.name "Jenkins"
                    git config user.email "jenkins@ecommerce.local"
                    git add helm/ecommerce/values.yaml
                    git commit -m "Update image tags to ${GIT_COMMIT_SHA}" || true
                    git push origin main || true
                '''
            }
        }
    }

    post {
        always {
            echo '🧹 Cleaning up...'
            sh 'docker logout'
        }
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
