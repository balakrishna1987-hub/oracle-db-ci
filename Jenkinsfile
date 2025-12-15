pipeline {
    agent any

    stages {

        stage('Checkout Source') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/balakrishna1987-hub/oracle-db-ci.git'
            }
        }

        stage('Deploy DDL') {
            steps {
                sh '''
                docker exec -i oracle-xe \
                sqlplus appuser/app123@XE < create_table.sql
                '''
            }
        }

        stage('Deploy DML') {
            steps {
                sh '''
                docker exec -i oracle-xe \
                sqlplus appuser/app123@XE < insert_employee.sql
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                docker exec -i oracle-xe \
                sqlplus appuser/app123@XE < verify.sql
                '''
            }
        }
    }
}

