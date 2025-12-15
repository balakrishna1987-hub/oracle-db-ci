pipeline {
    agent any

    stages {
        stage('Deploy DDL') {
            steps {
                sh '''
                echo "DDL files:"
                ls ddl
                docker exec -i oracle-xe sqlplus appuser/app123@XE < ddl/create_table.sql
                '''
            }
        }

        stage('Deploy DML') {
            steps {
                sh '''
                echo "DML files:"
                ls plsql
                docker exec -i oracle-xe sqlplus appuser/app123@XE < plsql/insert_employee.sql
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                echo "Verify files:"
                ls verify
                docker exec -i oracle-xe sqlplus appuser/app123@XE < verify/verify.sql
                '''
            }
        }
    }
}

