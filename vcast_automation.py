import time
import os
import sys
from settings import *
from subprocess import Popen, PIPE
from xml.etree.ElementTree import parse
from twilio.rest import Client

class vast_automation():

    def __init__(self):
        '''Initialize test results and log documentation.'''
        self.status_xmls = []
        self.fails = 0
        self.logger = open('log.txt', 'w')
        self.results_junit = open('test_results.xml', 'w')
        self.results_junit.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n")
        self.results_junit.write("<testsuites>\n")
        self.xml_content_passed = "<testsuite name=\"PASSED\">\n"
        self.xml_content_failed = "<testsuite name=\"FAILED\">\n"
        
        
    def get_files(self, path, ext):
    
        reg_scripts = []
        for root, dirs, files in os.walk(path):
            for file in files:
                if file.endswith(ext):
                    reg_scripts.append(os.path.join(root, file))
        return reg_scripts
        
        
    def execute_regression_scripts(self, reg_scripts):
    
        for reg_script in reg_scripts:
            self.decorate = False
            self.status_xmls = []
            dir, reg_script = os.path.split(reg_script)
            env_name, ext = os.path.splitext(reg_script)
            os.chdir(dir)
            self.monitor_status(reg_script, env_name)
        self.save_junit_results()
        self.logger.close()
        self.make_call()
        
        
    def make_call(self):
        client = Client(account_sid, auth_token)

        # Make the call
        
        url_cloud = "{}/{}?fails={}".format(CLOUD_URL, 'get_status', self.fails)
        print("url_cloud: ", url_cloud)
        call = client.api.account.calls\
                .create(to="+918142804767",  # Any phone number
                from_= sender, # Must be a valid Twilio number
                url=url_cloud)
        print(call.sid)
        
        
    def save_junit_results(self):
        
        self.results_junit.write(self.xml_content_passed+"</testsuite>\n")
        self.results_junit.write(self.xml_content_failed+"</testsuite>\n")
        self.results_junit.write("</testsuites>\n")
        self.results_junit.close()
            
            
    def monitor_status(self, reg_script, env_name):
    
        p = os.popen(reg_script, "r")
        while True:
            org_data = p.readline()
            self.logger.write(org_data)
            data = org_data.replace('\n', ' ')
            data = data.lower().replace(' ','_')
            if not data: break
            if data.find("created_execution_report") != -1:
                self.decorate = True
                self.get_execution_status(env_name)
            if data.find('the_html_report_was_saved_to') != -1:
                print(org_data)
            if data.find('running_command:_"%vectorcast_dir%\clicast"_/e:{}_execute_batch'.format(env_name.lower())) != -1:
                print('\n\n'+SEPERATOR)
            
            
    def get_execution_status(self, env_name):
    
        path = os.getcwd()
        path = os.path.join(path, env_name, 'TESTCASES', 'DATA')
        time.sleep(2)
        xmls = self.get_files(path, '.XML')
        xmls = list(set(xmls)^set(self.status_xmls))
        for xml in xmls:
            e = parse(xml).getroot()
            ts_name = e.findall('name')[0].text
            ts_status = e.findall('execution_status')[0].text
            
            if ts_status == TEST_NONE_STATUS: continue
            self.status_xmls.append(xml)
            if ts_status == TEST_PASS:
                self.xml_content_passed += '<testcase classname="PASSED" name="{}" status="passed" />\n'.format(ts_name)
            elif ts_status == TEST_FAIL:
                self.xml_content_failed += '<testcase classname="FAILED" name="{}" status="failed">\n\
                <error message="" type = "failed"> details about failure </error>\n</testcase>\n'.format(ts_name)
                self.fails += 1
            ts_name = "{} | ".format(ts_name + ' '*(100-len(ts_name)))
            print(ts_name, ts_status, '|')
            print(SEPERATOR)
            
            
    def cppcheck(self):
    
        
        cmd = '{}\cppcheck.exe --enable=all --xml 2 {} --output-file={}'.format(os.environ['CPPCHECK'], SOURCE_FILES_PATH, CPPCHECK_OP_FILE)
        #cmd = ['"C:\Program Files (x86)\Cppcheck\cppcheck.exe"', '--enable=all', '--xml', '2', "{}".format(SOURCE_FILES_PATH)]
        print(cmd)
        print("Running CPPCHECK...")
        os.system(cmd)
            
            
        
if __name__ == "__main__":
    scripts_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), SCRIPTS_FOLDER_NAME)
    obj = vast_automation()
    if sys.argv[1] == '1' or sys.argv[1] == '3':
        obj.cppcheck()
    if sys.argv[1] == '2' or sys.argv[1] == '3':
        reg_scripts = obj.get_files(scripts_path, '.bat')
        obj.execute_regression_scripts(reg_scripts)
    