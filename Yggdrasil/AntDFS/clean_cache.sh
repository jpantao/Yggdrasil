print_usage() {
    echo "Usage: ./$0 antdfs_dir"
}

if [ $# -ne 1 ]; then
    print_usage
    exit 1
else
    antdfs_dir=${1}
fi

sudo rm -f ${antdfs_dir}/antdfs.*/*
sudo rm -f ${antdfs_dir}/mount/*
