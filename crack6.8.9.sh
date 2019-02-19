#!/bin/bash
Green_font="\033[32m" && Yellow_font="\033[33m" && Red_font="\033[31m" && Font_suffix="\033[0m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
Important_one="${Red_font}[选择前须知:]${Font_suffix}"
Important_two="${Red_font}[温馨提示：必须先在面板成功安装插件后才能进行破解。]${Font_suffix}"
PANEL_DIR=/www/server/panel
PLUGIN_RETURN="${Yellow_font}在面板安装插件完成之后，从下表选择你要破解的插件:${Font_suffix}"
MAIN_RETURN=${Red_font}[宝塔面板v6.8.9破解脚本]${Font_suffix}
MAIN_RETURN1=${Red_font}[运行'2'之前记得一定要先安装好插件哦！]${Font_suffix}

install_bt_panel_pro(){
	curl http://download.bt.cn/install/update6.sh|bash
	echo -e "${Info} 宝塔专业版安装完成，正在进行下一步操作!"
}

get_crack_file(){
	mkdir /root/btpanelv6.8.9_crack
	cd /root/btpanelv6.8.9_crack
    wget -N --no-check-certificate https://sakurabk.net/bt6x/btpanelv6.8.9_crack.zip
    #mv Panel-5.9.0_pro.zip panel.zip
    unzip -o btpanelv6.8.9_crack.zip > /dev/null
}

copy_class_file(){
    cp -pf /root/btpanelv6.8.9_crack/soft.html ${PANEL_DIR}/BTPanel/templates/default/soft.html
	cp -pf /root/btpanelv6.8.9_crack/soft.js ${PANEL_DIR}/BTPanel/static/js/soft.js
	cp -pf /root/btpanelv6.8.9_crack/panelPlugin.py ${PANEL_DIR}/class/panelPlugin.py
	echo -e "${Info} 复制Class文件完成，正在进行下一步操作!"
}

restart_btpanel(){
	/etc/init.d/bt restart
	echo -e "${Info} 重启宝塔面板完成，正在进行下一步操作!"
}

install_tamper_proof(){
	cp -pf /root/btpanelv6.8.9_crack/tamper_proof_main.py ${PANEL_DIR}/plugin/tamper_proof/tamper_proof_main.py
	PLUGIN_RETURN=${Red_font}[网站防篡改程序]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_btwaf_httpd(){
	cp -pf /root/btpanelv6.8.9_crack/btwaf_httpd_main.py ${PANEL_DIR}/plugin/btwaf_httpd/btwaf_httpd_main.py
	PLUGIN_RETURN=${Red_font}[Apache防火墙]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_total_main(){
	cp -pf /root/btpanelv6.8.9_crack/total_main.py ${PANEL_DIR}/plugin/total/total_main.py
	PLUGIN_RETURN=${Red_font}[网站监控报表]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_btwaf(){
	cp -pf /root/btpanelv6.8.9_crack/btwaf_main.py ${PANEL_DIR}/plugin/btwaf/btwaf_main.py
	PLUGIN_RETURN=${Red_font}[Nginx防火墙]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_load_leveling(){
	cp -pf /root/btpanelv6.8.9_crack/load_leveling_main.py ${PANEL_DIR}/plugin/load_leveling/load_leveling_main.py
	PLUGIN_RETURN=${Red_font}[宝塔负载均衡]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_masterslave(){
	cp -pf /root/btpanelv6.8.9_crack/masterslave_main.py ${PANEL_DIR}/plugin/masterslave/masterslave_main.py
	PLUGIN_RETURN=${Red_font}[MYSQL主从复制]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_task_manager(){
	cp -pf /root/btpanelv6.8.9_crack/task_manager_main.py ${PANEL_DIR}/plugin/task_manager/task_manager_main.py
	PLUGIN_RETURN=${Red_font}[任务管理器]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

install_rsync(){
	cp -pf /root/btpanelv6.8.9_crack/rsync_main.py ${PANEL_DIR}/plugin/rsync/rsync_main.py
	PLUGIN_RETURN=${Red_font}[数据同步工具]${Font_suffix}破解完成，继续破解或返回主菜单: && plugin_choose
}

del_crack_file(){
	rm -rf /btpanelv6.8.9_crack
	MAIN_RETURN=${Red_font}[删除破解包]${Font_suffix}操作已完成。
}

setup(){
	install_bt_panel_pro
	get_crack_file
	copy_class_file
	restart_btpanel
	MAIN_RETURN=${Red_font}[升级专业版]${Font_suffix}操作已完成。
	main
}

plugin_choose(){
clear
echo -e "${White_font}
#====================================================
# ${Important_one} 
# ${Important_two} 
#====================================================
# ${PLUGIN_RETURN}
#====================================================
#          1.网页防篡改程序
#          2.Apache防火墙
#          3.网站监控报表
#          4.Nginx防火墙
#          5.宝塔负载均衡
#          6.MYSQL主从复制
#          7.任务管理器
#          8.数据同步工具
#          9.返回主菜单
#====================================================
${Font_suffix}"

read -p "输入数字以选择:" choose_function

while [[ ! "${choose_function}" =~ ^[1-9]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" choose_function
	done

if [[ "${choose_function}" == "1" ]]; then
	install_tamper_proof
elif [[ "${choose_function}" == "2" ]]; then
	install_btwaf_httpd
elif [[ "${choose_function}" == "3" ]]; then
	install_total_main
elif [[ "${choose_function}" == "4" ]]; then
	install_btwaf
elif [[ "${choose_function}" == "5" ]]; then
	install_load_leveling
elif [[ "${choose_function}" == "6" ]]; then
	install_masterslave
elif [[ "${choose_function}" == "7" ]]; then
	install_task_manager
elif [[ "${choose_function}" == "8" ]]; then
	install_rsync
elif [[ "${choose_function}" == "9" ]]; then
	main
fi
}

main(){
clear
echo -e "${Green_font}
#=======================================
# Name:         bt-6.8.9-crack
# Version:      6.8.9
# Author:       樱花博客
# Copyright:    https://www.sakurabk.net
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURN}"
echo -e "1.升级专业版\n2.进行插件破解 ${MAIN_RETURN1}\n3.删除破解包\n4.退出脚本"
read -p "输入数字以选择:" function

while [[ ! "${function}" =~ ^[1-4]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" function
	done

if [[ "${function}" == "1" ]]; then
	setup
elif [[ "${function}" == "2" ]]; then
	plugin_choose
elif [[ "${function}" == "3" ]]; then
	del_crack_file
else
	clear
	exit 1
fi
}

main