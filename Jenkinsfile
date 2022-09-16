pipeline {
    agent any
    triggers {
        cron "H 23 * * *"
    }
    options {
        timestamps()
        ansiColor("xterm")
        disableConcurrentBuilds()
    }
    stages {
        stage('build') {
            steps {
                sh "./build.sh"
            }
        }
        stage('push') {
            steps {
                sh "./push.sh"
            }
        }
    }
    post {
        cleanup {
            cleanWs(deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }
}
