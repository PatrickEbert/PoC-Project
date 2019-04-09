############################################################################
# 
# Pentaho job execution via CLI to integrate with Control-M
#
############################################################################
BASEDIR="$( cd "$ dirname & "${BASH_SOURCE[0]}" )" && pwd )"
cd ${BASEDIR}/../../base/
. {$BASEDIR}/../../base/init.sh $0
cd ${BASEDIR}

export EXAMPLE_FLAG_FOLDER=$CONFIG_HOME/_flagfiles/Flagfiles

cd ${BASEDIR}/../../base/
sh kitchen.sh <file_handling or gl>/etl/repository/example.kjb -param:EXAMPLE_DATE=$ORDER_DATE -level:Basic

retcode=$?
echo -e "\n Pentaho return code: $retcode \n"
if[ $retcode = 0] || [$retcode -gt 8]
then
	echo -e "Pentaho job example.kjb completed successfully \n"
elif [$retcode = 1]
then
	if[ -f {$EXAMPLE_FLAG_FOLDER}/EXAMPLE_FLAG_FILE ]
	then
		#
		#INSERT OWN CODE TO INTERACT WITH CONTROL-M VIA CUSTOM RETURN CODES HERE
		# e.g. exit 4
		exit
	else
		echo -e "\Pentaho process failed, please check above log \n"
		exit 8
	fi
else
	echo -e "\Pentaho process failed, please check above log \n"
	exit 8
fi

echo -e "$1 completed successfully"