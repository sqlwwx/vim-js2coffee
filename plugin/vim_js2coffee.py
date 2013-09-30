import subprocess
import os
import stat

JS_FILE = "/tmp/file.js"
COFFEE_FILE = "/tmp/file.coffee"
ERROR_LOG = "/tmp/error.log"


def get_coffee_from_js_buffer_contents(buffer_contents):
    write_buffer_contents_to_file(JS_FILE, buffer_contents)
    run_js_to_coffee_on_js_file()
    check_for_errors()
    new_buf = read_file_lines(COFFEE_FILE)
    return new_buf


def get_js_from_coffee_buffer_contents(buffer_contents):
    write_buffer_contents_to_file(COFFEE_FILE, buffer_contents)
    run_coffee_to_js_on_coffee_file()
    check_for_errors()
    new_buf = read_file_lines(JS_FILE)
    return new_buf[1:]


def write_buffer_contents_to_file(file_name, contents):
    with open(file_name, "w") as f:
        for line in contents:
            f.write(line + "\n")


def run_js_to_coffee_on_js_file():
    try:
        subprocess.check_call("js2coffee {0} > {1} 2> {2}".format(JS_FILE, COFFEE_FILE, ERROR_LOG), shell=True)
    except:
        raise Exception("You don't have js2coffee npm install it and try again")


def run_coffee_to_js_on_coffee_file():
    subprocess.call("coffee -c {0} 2> {1}".format(COFFEE_FILE, ERROR_LOG), shell=True)


def check_for_errors():
    if os.stat("/tmp/error.log")[stat.ST_SIZE]:
        raise Exception("There is an error in the conversion.\n \
                        Ensure you have coffee or js2coffee installed and check your syntax.")


def read_file_lines(file_to_read):
    with open(file_to_read, "r") as f:
        return [l.rstrip('\n') for l in f.readlines()]
