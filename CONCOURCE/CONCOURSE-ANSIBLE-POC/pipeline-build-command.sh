https://concourse-ci.org/fly.html#fly-login


fly --target bubbleverse login -u test -p test --concourse-url http://ec2-54-197-242-47.compute-1.amazonaws.com:8080
fly -t bubbleverse status
fly -t bubbleverse userinfo
fly -t bubbleverse set-pipeline -p "hello_world" -c concourse_example.yml
fly -t bubbleverse unpause-pipeline -p hello_world
fly -t bubbleverse trigger-job -j hello_world/simple