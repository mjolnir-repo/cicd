terraform remote config\
    -backend=s3\
    -backend-config="bucket=<mjolnir-cicd-terraform-remote-state-location>"\
    -backend-config="key=global/state-files/<state file name>"
    -backend-config="region=us-east-1"
    -backend-config="encrypt=true"