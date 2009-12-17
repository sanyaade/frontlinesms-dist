#!/bin/sh
# FrontlineSMS Launcher for Linux & OS-X
#
# Author Emmanuel Kala <emkala@gmail.com>

echo "Launching FrontlineSMS..."

# Change to the directory hosting this script
cd `dirname $0`

# Name of the JAR file containing the main class
CLASSPATH="${project.artifactId}-${project.version}.jar"

# Get all the JARs in a folder and add them to the classpath variable
function buildClasspath() {
	for jar in $(ls $1/*.jar); do
	    CLASSPATH="$CLASSPATH:$jar"
	done
}

buildClasspath("lib")
buildClasspath("cp")

# Launch the application
java -classpath $CLASSPATH net.frontlinesms.DesktopLauncher
