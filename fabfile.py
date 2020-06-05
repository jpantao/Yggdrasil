import os
import getpass
import datetime
from fabric.api import *

yggdrasil_lowlevel= "./Yggdrasil-LowLevelLib"
yggdrasil_home= "./Yggdrasil"

yggdrasil_lowlevel_remote= "~/Yggdrasil-LowLevelLib"
yggdrasil_remote= "~/Yggdrasil"

# raspis = ['192.168.1.101']

# raspis = ['192.168.1.102','192.168.1.106','192.168.1.118']

# ALL
# raspis = [
#     '192.168.1.101','192.168.1.102','192.168.1.103','192.168.1.104','192.168.1.105',
#     '192.168.1.106','192.168.1.107','192.168.1.108','192.168.1.109','192.168.1.110',
#     '192.168.1.111','192.168.1.112','192.168.1.113','192.168.1.114','192.168.1.115',
#     '192.168.1.116','192.168.1.117','192.168.1.118','192.168.1.119','192.168.1.120',
#     '192.168.1.121'
#     ]

raspis = [
    '192.168.1.101','192.168.1.102','192.168.1.105',
    '192.168.1.107','192.168.1.108',
    '192.168.1.113','192.168.1.114',
    '192.168.1.116','192.168.1.118','192.168.1.119'
]


#raspis = [
#     '192.168.1.101','192.168.1.102','192.168.1.103','192.168.1.104','192.168.1.108','192.168.1.109',
#     '192.168.1.111','192.168.1.112','192.168.1.114','192.168.1.115',
#     '192.168.1.116','192.168.1.118','192.168.1.119'
#     ]


# UP
# raspis = ['192.168.1.101','192.168.1.110','192.168.1.106','192.168.1.107',
# '192.168.1.121','192.168.1.122','192.168.1.108','192.168.1.115']
# '192.168.1.112','192.168.1.124'
# DOWN
# raspis = [

def __get_hosts(hosts_dict, hosts_per_dc):
    hosts = []
    hosts = raspis
    return hosts


env.user = getpass.getuser()
env.disable_known_hosts = True
env.userKey = '~/.ssh/id_rsa'
env.key_filename = '~/.ssh/id_rsa'


@parallel
@hosts(raspis)
def setethers():
    run('sudo cp ~/tools/ethers /etc/')


@parallel
@hosts(raspis)
def setarptable():
    run('sudo arp -f')



@hosts(raspis)
def checkAlive():
    with warn_only():
        run('hostname')


@parallel
@hosts(raspis)
def clock():
    run('date')


@parallel
@hosts(raspis)
def adduser(username,password):
    with settings(prompts={'New password: ' : password, 'Retype new password: ' : password}):
        run('sudo adduser --gecos "" ' + username)


@parallel
@hosts(raspis)
def usermod(username,group):
    run('sudo usermod -a -G '+group+' '+username)


@hosts(raspis)
def deluser(username):
    run('sudo deluser ' + username)


@parallel
@hosts(raspis)
def synclock():
#    env.date = local('date')
    now = datetime.datetime.now()
    local('ssh -o StrictHostKeyChecking=no -i ' + env.userKey + ' ' + env.user + '@' + env.host + ' "sudo date +\'%Y-%m-%d %T.%N\' -s \'' + str(now) + '\'"')


@parallel
@hosts(raspis)
def sync():
    local('rsync -avz --delete --exclude "*CMakeFiles*" --exclude "*.o" --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' ' + yggdrasil_lowlevel + ' ' + env.user + '@%s:~/Production/' % (env.host))
    local('rsync -avz --delete --exclude "*CMakeFiles*" --exclude "*.o" --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' ' + yggdrasil_home + ' ' + env.user + '@%s:~/Production/' % (env.host))
    local('rsync -avz --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' CMakeLists.txt ' + env.user + '@%s:~/Production/' % (env.host))
    local('rsync -avz --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' fabfile.py ' + env.user + '@%s:~/' % (env.host))
    local('rsync -avz --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' tools ' + env.user + '@%s:~/' % (env.host))


@parallel
@hosts(raspis)
def createYggConfigDir():
    run("sudo mkdir /etc/yggdrasil | 0; sudo mkdir /etc/yggdrasil/topologyControl | 0; sudo chmod -R 777 /etc/yggdrasil")


@parallel
@hosts(raspis)
def createYggdrasilHome():
    run("sudo mkdir /home/yggdrasil; sudo chmod -R 755 /home/yggdrasil")


@parallel
@hosts(raspis)
def configureYggdrasilHome():
    run("sudo mkdir /home/yggdrasil/aggregation-nofaults; sudo mkdir /home/yggdrasil/cmd; sudo mkdir /home/yggdrasil/bin")


@parallel
@hosts(raspis)
def updateYggdrasilControl():
    run("sudo cp ~/Production/bin/YggdrasilControlProcess /home/yggdrasil/; sudo chmod 777 /home/yggdrasil/YggdrasilControlProcess")
    #run("sudo cp ~/Production/bin/init /home/yggdrasil/YggdrasilControlProcess; sudo chmod 777 /home/yggdrasil/YggdrasilControlProcess")


@parallel
@hosts(raspis)
def addBinToYggdrasilHome():
    run("sudo cp /home/"+ (env.user) +"/bin/cmd* /home/yggdrasil/cmd; sudo cp /home/"+ (env.user) +"/bin/agg* /home/yggdrasil/bin")
    run("sudo chmod 777 /home/yggdrasil/cmd/*; sudo chmod 777 /home/yggdrasil/bin/*")


@parallel
@hosts(raspis)
def cleanYggdrasilHome():
    run("sudo rm -rf /home/yggdrasil/*")


@hosts(raspis)
def checkLogs(folder):
    run("ls -aloh /home/yggdrasil/"+folder)

@parallel
@hosts(raspis)
def getLogs(folder):
    get("/home/yggdrasil/"+folder)

@parallel
@hosts(raspis)
def rmLogs(folder):
    choice = input("Are you sure you want to remove this? /home/yggdrasil/"+folder)
    yes = {'yes', 'y', 'ye', ''}
    no = {'no', 'n'}

    if choice in yes:
        run("rm -rf /home/yggdrasil/"+folder+"/*")
    elif choice in no:
        return
    else:
        print("Please respond with 'yes' or 'no'")


@parallel
@hosts(raspis)
def mvStuff(f,t):
    run("sudo mv "+f+" "+t)


@parallel
@hosts(raspis)
def updateTopology():
    local('rsync -avz --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' topologyControl/macAddrDB.txt ' + env.user + '@%s:/etc/yggdrasil/topologyControl/' % (env.host))
    local('scp -i ' + env.userKey + ' topologyControl/'+(env.host)+ ' ' + env.user + '@%s:/etc/yggdrasil/topologyControl/neighs.txt' % (env.host))
    run("sudo chmod -R 777 /etc/yggdrasil")

@parallel
@hosts(raspis)
def removeTopology():
    run("sudo rm /etc/yggdrasil/topologyControl/neighs.txt")

@parallel
@hosts(raspis)
def test():
    run("hostname")

@hosts(raspis)
def checkUsers():
    run("ls /home/")


@parallel
@hosts(raspis)
def reboot():
    run("sudo reboot")


@parallel
@hosts(raspis)
def shutdown():
    run("sudo shutdown now")

@parallel
@hosts(raspis)
def run_target(target):
    with cd("~/Production"):
        run("bin/"+target +" 169.254.242.48 5000 2>&1 > "+ target+".out &")

@parallel
@hosts(raspis)
def build(target):
    with cd("~/Production/build"):
        run("cmake .. && make "+target)

@parallel
@hosts(raspis)
def buildAll():
    with cd("~/Production/build"):
        run("cmake .. && make ")

@parallel
@hosts(raspis)
def exec(command):
    run(command)