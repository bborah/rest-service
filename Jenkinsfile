pipeline {
    agent any
    
    tools {
        maven '3.8.5'
    }
    
    stages{
        
        stage("Build Maven Project"){
            steps{
                
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '07167a61-baef-4493-9346-7cde00a096fb', name: 'Bibek', url: 'https://github.com/bborah/rest-service.git']]])
                sh "mvn clean install"
            }
        }
        
        stage ("Build Docker Image"){
            steps{
                script{
                    sh 'docker build -t bibek2017/spring-aks-test .'
                }
            }
        }
        
        stage ("Push to docker Hub"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'b4cf459b-d3f2-4a85-8a05-5ead534238ac', variable: 'docker_hub_pwd')]) {
                        sh 'docker login -u bibek2017 -p London_Jan_2022'
                    }
                    sh 'docker push bibek2017/spring-aks-test'
                }
            }
        }
        
    }
    
}