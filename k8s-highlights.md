# K8s Deployments
- You can have multiple application instances in same cluster by use of labels.
- You can scale up/down number of replicas.
    - kubectl scale deployment/my-nginx --replicas=1
- you can specify minimum and maximum repicas and K8s will manage requied replicas based on load for you.
    - kubectl autoscale deployment/my-nginx --min=1 --max=3
- ensures that only a certain number of old replicas may be down while they are being updated

#VMs vs Containers
- Server gets sliced into multiple VMs (lets say 4). Each VM needed its own OS so they needed all the resources that OS needs which are CPU,RAM Memory, Networking resources(cards/ips),  disk and especially OS license cost which can be substantial based on which OS you are running
- each VM needs maintenance like upgrades and security patches. Admin time/cost to manage all this.
- Containers have one OS on which we run containers which are app focused.
- Containers frees up more resources to get more juice out of physical hardware machine
- Container is an ring feched ared of OS with some limits on how much system resources it can use. We can more than one these areas on OS. We can build different types of containers.Linux OS Namespaces and conrol groups are used to enforce these limits. Namespaces and control groups are low level kernel constructs. 
- Namespaces lets us carve out OS resources into separate isolation areas called containers.one container does not know about other containers on same OS. Different namespaces on linux os are
    -  process ID (pid)-it gives each container its own process tree.
    -  Network (net)- gives isolated network resources like nix, ips, routing tables
    -  Filesystem/mount (mnt)-isolated root file system (/ on linux, c: on windows)
    -  Inter-proc comms (ipc)-processes in single container access shared same memory. 
    -  UTS (uts)-separate hostname
    -  User (user)-accounts inside container map to users on host
- Control Groups (aka c groups). it groups processes and impose limits.
    - group processes
    - import limits
- 