#!/usr/bin/bash

set -e

log_string="%s: %f\n"

antdfs_mount_dir=""
antdfs_dir_flag=false

debug_flag=false

num_tests_flag=flag
num_tests="1"

write_content_flag=false
write_content_size="1"

remote_readings_flag=false
remote_files_dir=""

create_remote_files_flag=false
create_remote_files_num=0

standard_tests_flag=false

WRITE_FILE_OP="WRITE_FILE"
READ_FILE_OP="READ_FILE"
LIST_FILE_OP="LIST_FILE"
READ_REMOTE_OP="READ_REMOTE_FILE"

remote_file_pattern="remote_file_*"
create_remote_file_pattern="remote_file_XXXXX"

print_usage() {
    echo "Usage: ./$0 -a antdfs_dir -n number_of_tests"
    echo "a - AntDFS mounted dir (with argument)"
    echo "d - debug"
    echo "n - number of tests to perform (with argument)"
    echo "w - number of bytes to write to file"
    echo "r - remote readings only"
    echo "t - standard read/write/list tests"
    echo "c - create remote files to be read (with argument, number of files to create)"
}

while getopts ':a:n:w:drc:t' flag; do
    case "${flag}" in
        a)
            antdfs_dir_flag=true
            antdfs_mount_dir="${OPTARG}"
            ;;
        d)
            debug_flag=true
            ;;
        n)
            num_tests_flag=true
            num_tests="${OPTARG}"
            ;;
        w)
            write_content_flag=true
            write_content_size="${OPTARG}"
            ;;
        r)
            remote_readings_flag=true
            ;;
        c)
            create_remote_files_flag=true
            create_remote_files_num="${OPTARG}"
            ;;
        t)
            standard_tests_flag=true
            ;;
        :)
            echo "Missing option argument for -$OPTARG" >&2
            exit 1
            ;;
        *)
            print_usage
            exit 1
            ;;
    esac
done

if ! $antdfs_dir_flag; then
    print_usage
    exit 1
fi

if $debug_flag; then
    echo "AntDFS mount dir: ${antdfs_mount_dir}"
fi

parse_times() {
    times=($(echo $1 | awk '{print $2}' | sed 's/0m//' | sed 's/s//'))
    total_time=${times[0]}
}

create_remote_files() {
    for ((i = 0; i<$create_remote_files_num; i++)); do
        remote_file_name=$(mktemp -u ${create_remote_file_pattern})
        echo -n "$content" >${antdfs_mount_dir}/${remote_file_name}

        if $debug_flag; then
            echo "created remote file ${antdfs_mount_dir}/${remote_file_name})"
        fi
    done
}

content=$(head -c $write_content_size </dev/zero | tr '\0' '\141')

# -------------------------------------------------------------------------------------------
# ------------------------------------------ TESTS ------------------------------------------
# -------------------------------------------------------------------------------------------

test_list() {
    test_dir=$1

    if $debug_flag; then
        echo "listing dir ${test_dir}"
    fi

    time_took_list=$(time (ls $test_dir) 2>&1 1>/dev/null)
    parse_times "$time_took_list"
}

test_read() {
    test_dir=$1

    filenames=(${test_dir}/*)
    if [ ${#filenames[@]} -gt 0 ]; then
        if $debug_flag; then
            echo "reading file ${test_dir}/${test_filename}"
        fi

        time_took_read=$(time (cat ${test_dir}/${test_filename}) 2>&1 1>/dev/null)
        parse_times "$time_took_read"

    else
        echo "ERROR: read test failed, no files to read"
        exit 1
    fi
}

test_write() {
    test_dir=$1

    test_file_path="${test_dir}/${test_filename}"
    test_string="this is a test file content"

    if $debug_flag; then
        echo "writing to file ${test_file_path}"
    fi

    time_took_write=$(time (echo -n "$content" >$test_file_path) 2>&1 1>/dev/null)
    parse_times "$time_took_write"
}

read_remote_files() {
    remote_files=(${antdfs_mount_dir}/${remote_file_pattern})
    total_time_took_remote="0.0"

    if $debug_flag; then
        echo "Will read ${#remote_files[@]} remote files"
    fi

    for file_name in "${remote_files[@]}"; do
        if $debug_flag; then
            echo "reading remote file ${file_name}"
        fi
        time_took=$(time (cat ${file_name}) 2>&1 1>/dev/null)
        parse_times "$time_took"
        total_time_took_remote=$(echo "${total_time_took_remote}+${total_time}" | bc)
    done

    avg_remote_read_time=$(echo "scale=6; ${total_time_took_remote}/${#remote_files[@]}" | bc)
}

test_remote_readings() {
    read_remote_files

    echo "============= RESULTS REMOTE READINGS ============="
    echo "AVERAGES:"
    printf "\t${log_string}" "${READ_REMOTE_OP}" "$avg_remote_read_time"
    echo "TOTALS:"
    printf "\t${log_string}" "${READ_REMOTE_OP}" "$total_time_took_remote"

    read_remote_files

    echo "============= RESULTS REMOTE READINGS - CACHED ============="
    echo "AVERAGES:"
    printf "\t${log_string}" "${READ_REMOTE_OP}" "$avg_remote_read_time"
    echo "TOTALS:"
    printf "\t${log_string}" "${READ_REMOTE_OP}" "$total_time_took_remote"
}

standard_tests() {
    total_write_time="0.0"
    total_read_time="0.0"
    total_list_time="0.0"

    for ((i = 0; i < $num_tests; i++)); do
        test_filename=$(mktemp -u tempfile_XXXXX)
        test_write $antdfs_mount_dir
        total_write_time=$(echo "${total_write_time}+${total_time}" | bc)
        test_read $antdfs_mount_dir
        total_read_time=$(echo "${total_read_time}+${total_time}" | bc)
        test_list $antdfs_mount_dir
        total_list_time=$(echo "${total_list_time}+${total_time}" | bc)
    done

    echo "============= RESULTS ANTDFS ============="
    echo "AVERAGES:"
    avg_write_time=$(echo "scale=6; ${total_write_time}/${num_tests}" | bc)
    avg_read_time=$(echo "scale=6; ${total_read_time}/${num_tests}" | bc)
    avg_list_time=$(echo "scale=6; ${total_list_time}/${num_tests}" | bc)

    printf "\t${log_string}" "${WRITE_FILE_OP}" "$avg_write_time"
    printf "\t${log_string}" "${READ_FILE_OP}" "$avg_read_time"
    printf "\t${log_string}" "${LIST_FILE_OP}" "$avg_list_time"

    echo "TOTALS:"

    printf "\t${log_string}" "${WRITE_FILE_OP}" "$total_write_time"
    printf "\t${log_string}" "${READ_FILE_OP}" "$total_read_time"
    printf "\t${log_string}" "${LIST_FILE_OP}" "$total_list_time"

    default_fs_dir=$(mktemp -d)

    if $debug_flag; then
        echo "NOTE: using ${default_fs_dir} as default fs test dir"
    fi

    total_write_time="0.0"
    total_read_time="0.0"
    total_list_time="0.0"

    for ((i = 0; i < $num_tests; i++)); do
        test_filename=$(mktemp -u tempfile_XXXXX)
        test_write $default_fs_dir
        total_write_time=$(echo "${total_write_time}+${total_time}" | bc)
        test_read $default_fs_dir
        total_read_time=$(echo "${total_read_time}+${total_time}" | bc)
        test_list $default_fs_dir
        total_list_time=$(echo "${total_list_time}+${total_time}" | bc)
    done

    echo "============= RESULTS DEFAULT FS ============="
    echo "AVERAGES:"

    avg_write_time=$(echo "scale=6; ${total_write_time}/${num_tests}" | bc)
    avg_read_time=$(echo "scale=6; ${total_read_time}/${num_tests}" | bc)
    avg_list_time=$(echo "scale=6; ${total_list_time}/${num_tests}" | bc)

    printf "\t${log_string}" "${WRITE_FILE_OP}" "$avg_write_time"
    printf "\t${log_string}" "${READ_FILE_OP}" "$avg_read_time"
    printf "\t${log_string}" "${LIST_FILE_OP}" "$avg_list_time"

    echo "TOTALS:"

    printf "\t${log_string}" "${WRITE_FILE_OP}" "$total_write_time"
    printf "\t${log_string}" "${READ_FILE_OP}" "$total_read_time"
    printf "\t${log_string}" "${LIST_FILE_OP}" "$total_list_time"
}

if $remote_readings_flag; then
    test_remote_readings
fi

if $create_remote_files_flag; then
    create_remote_files
fi

if $standard_tests_flag; then
    standard_tests
fi
