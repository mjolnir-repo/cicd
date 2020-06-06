terraform remote config\
    -backend=s3\
    -backend-config="bucket=<mjolnir-cicd-terraform-remote-state-location>"\
    -backend-config="key=global/state-files/<your state file name>"
    -backend-config="region=<your choice of region>"
    -backend-config="encrypt=true"