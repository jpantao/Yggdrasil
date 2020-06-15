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
raspis = [
    '192.168.1.101','192.168.1.102','192.168.1.103','192.168.1.104','192.168.1.105',
    '192.168.1.106','192.168.1.107','192.168.1.108','192.168.1.109','192.168.1.110',
    '192.168.1.111','192.168.1.112','192.168.1.113','192.168.1.114','192.168.1.115',
    '192.168.1.116','192.168.1.117','192.168.1.118','192.168.1.119','192.168.1.120',
    '192.168.1.121'
    ]

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
def configureboot():
    with cd("~/tools/"):
        run("sudo mv yggdrasil_control.sh /etc/init.d/")
        run("sudo chmod +x /etc/init.d/yggdrasil_control.sh")
        run("sudo cp *.sh /home/yggdrasil/tools")
        run("sudo chmod +x /home/yggdrasil/tools/*.sh")
        run("sudo cp runonboot.txt /home/yggdrasil/tools")
    with cd("/etc/init.d"):
        run("sudo update-rc.d yggdrasil_control.sh defaults")

@parallel
@hosts(raspis)
def run_target(target):
    with cd("~/Production"):
        run("bin/"+target +" 169.254.242.48 5000 2>&1 > "+ target+".out &")

@parallel
@hosts(raspis)
def build(target):
    with cd("~/Production/build"):
        run("cmake ..; make "+target)

@parallel
@hosts(raspis)
def rebuild():
    run("make")

@parallel
@hosts(raspis)
def runtest(test):
    with cd("~/Production"):
        run("/usr/bin/nohup tools/run.sh " + test)

@parallel
@hosts(raspis)
def runtestwitharg(test, arg):
    with cd("~/tools/"):
        run("/usr/bin/nohup ./runWithArg.sh " + test + " " + arg)

@parallel
@hosts(raspis)
def checktestlive(test):
    run("sudo ps ax | grep '"+test+"' | wc -l")

@parallel
@hosts(raspis)
def stopcontrol():
    run("sudo kill -3 `pidof YggdrasilControlProcess`")

@parallel
@hosts(raspis)
def stoptest(test):
    run("sudo killall -3 " + test)

@parallel
@hosts(raspis)
def killtest(test):
    run("sudo killall -9 " + test)

@parallel
@hosts(raspis)
def armageddon():
    run("sudo rm -rf ~/*")

@parallel
@hosts(raspis)
def rmnohup():
    run("sudo rm tools/nohup.out")

@parallel
@hosts(raspis)
def instalBatman():
    run("wget https://downloads.open-mesh.org/batman/stable/sources/batman/batman-0.3.tar.gz; tar xzvf batman-0.3.tar.gz; cd batman-0.3; make")

@parallel
@hosts(raspis)
def setBatman():
    with cd("~/batman-0.3"):
        run("sudo cp batmand /usr/sbin/")

@parallel
@hosts(raspis)
def runBatman():
    run("sudo batmand -o 2000 wlan0")

@parallel
@hosts(raspis)
def killBatman():
    run("sudo killall -9 batmand")

@parallel
@hosts(raspis)
def setAdhoc():
    run("sudo iw dev wlan0 set type ibss")
    run("sudo iw dev wlan0 ibss join ledge 2412")


@parallel
@hosts(raspis)
def runExp(exp):
    with cd("~/tools/"):
        run("/usr/bin/nohup ./runExp.sh " + exp)

@parallel
@hosts(raspis)
def stopExp(exp,out):
    run("sudo killall -3 "+exp)
    run("mv /home/yggdrasil/output_exp.out "+out)


@parallel
@hosts(raspis)
def mkdir(dir):
    run("mkdir "+dir)


@hosts(raspis)
def checkfiles():
    run("sudo ls -raloh files/90*")

@parallel
@hosts(raspis)
def rmfiles():
    run("sudo rm -r files/90*")


@parallel
@hosts(raspis)
def checkFAILED():
    with cd("~/Production"):
        run("grep FAILED BenchB.out")

@hosts(raspis)
def checkPUT():
    with cd("~/Production"):
        run("grep PUT BenchB.out | wc -l")

@parallel()
@hosts(raspis)
def install(package):
    run("sudo apt install " + package)


@parallel()
@hosts(raspis)
def getResults():
    get("Results/*")


#---------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------- Cloudy-----------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------

cloudy = [
    #VM
    'ygg@10.1.24.136',
    'ygg@10.139.40.117',
    'ygg@10.139.40.76',
    #RPI
    'ygg@10.1.24.150',
    #'ygg@10.139.40.221', host is down
    'ygg@10.139.40.222',
    'ygg@10.139.40.223',
    'ygg@10.139.40.224',
    'ygg@10.139.40.225',
    'ygg@10.139.40.226',
    #Picasso TestBed
    'ygg@10.1.24.40',
    #'ygg@10.1.10.26',
    'ygg@10.228.206.40',
    'ygg@10.1.15.70',
    #'ygg@10.1.13.103', unreachable
    #'ygg@10.1.9.47', no internet
    'ygg@10.1.8.246',
]

@hosts(cloudy)
def test_cloudy():
    run("hostname")


@parallel
@hosts(cloudy)
def mkdir_cloudy(dir):
    run('mkdir '+dir)

@parallel
@hosts(cloudy)
def sync_cloudy():
    local('rsync -avz --delete --exclude "*CMakeFiles*" --exclude "*.o" --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' ' + yggdrasil_lowlevel + ' ' + env.user + '@%s:~/yggdrasil/' % (env.host))
    local('rsync -avz --delete --exclude "*CMakeFiles*" --exclude "*.o" --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' ' + yggdrasil_home + ' ' + env.user + '@%s:~/yggdrasil/' % (env.host))
    local('rsync -avz --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' CMakeLists.txt ' + env.user + '@%s:~/yggdrasil/' % (env.host))
    #local('rsync -avz --rsh="ssh -o StrictHostKeyChecking=no" -i ' + env.userKey + ' tools ' + env.user + '@%s:~/' % (env.host))

@parallel
@hosts(cloudy)
def build_cloudy(target):
    with cd("~/yggdrasil/build"):
        run("cmake ..; make "+target)

@parallel
@hosts(cloudy)
def install_cloudy(package):
    run('sudo apt-get install '+package)

@parallel
@hosts(cloudy)
def rm_files_cloudy():
    run("rm -r files/900*")

@parallel
@hosts(cloudy)
def rm_file_cloudy(filename):
    run("rm files/900*/"+filename)


@parallel
@hosts(cloudy)
def get_outs_cloudy():
    get("~/yggdrasil/*.out")


@parallel
@hosts(cloudy)
def clean_cloudy():
    run("rm ~/yggdrasil/*.out")


@parallel
@hosts(cloudy)
def transfer(file):
    local("scp "+ file + " " +  env.user + '@%s:~/yggdrasil/' % (env.host))


