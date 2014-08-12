guest_root_dir=/var/lib/jenkins
guest_plugins_dir=$guest_root_dir/plugins

host_root_dir=/vagrant/provisions/files/jenkins
host_plugins_dir=$host_root_dir/plugins

plugins_url=http://updates.jenkins-ci.org/latest

mkdir -p $guest_plugins_dir

plugin_list=( "ansicolor" "ant" "antisamy-markup-formatter" "artifactory" "copyartifact" "credentials" "cvs" "disk-usage" "email-ext" "envinject" "extended-choice-parameter" "extensible-choice-parameter" "external-monitor-job" "git" "git-client" "git-parameter" "htmlpublisher" "javadoc" "jobConfigHistory" "ldap" "mailer" "matrix-auth" "maven-plugin" "pam-auth" "parameterized-trigger" "publish-over-ssh" "scm-api" "scm-sync-configuration" "ssh-credentials" "ssh-slaves" "subversion" "token-macro" "translation" "windows-slaves" "ws-cleanup" )

echo "Install Jenkins plugins"

for i in "${plugin_list[@]}"
do
  if [ ! -f $host_plugins_dir/$i.hpi ]; then
    echo "Caching plugin $i"
    wget --no-check-certificate $plugins_url/$i.hpi -O $host_plugins_dir/$i.hpi > /dev/null 2> /dev/null
  fi
done

cd $host_plugins_dir && cp *.hpi $guest_plugins_dir

chgrp -R jenkins $guest_root_dir
chown -R jenkins $guest_root_dir

service jenkins restart
