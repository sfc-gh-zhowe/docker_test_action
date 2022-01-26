#!/bin/sh
ERRCOUNT=-1
LASTERRCOUNT=9999
counter=1
echo "GITHUB_WORKSPACE: ${GITHUB_WORKSPACE}"
echo "ENV: ${ENV}"
ENV_VARS="{\"ENV\": \"${ENV}\"}"
echo "ENV_VARS: ${ENV_VARS}"
ls -AR ${GITHUB_WORKSPACE}/schemachange_delta

until [ $ERRCOUNT -eq 0 ] || [ $counter -gt 20 ]
do
  echo "Running schemachange. Pass = ${counter}"
  python3 /cli.py -f ${GITHUB_WORKSPACE}/schemachange_delta -a $SF_ACCOUNT -u $SF_USERNAME -r $SF_ROLE -w $SF_WAREHOUSE -d $SF_DATABASE -c $SF_DATABASE.UTL_COMMON.CHANGE_HISTORY -v --vars "${ENV_VARS}" --ignore-errors --out-of-seq
  ERRCOUNT=$?
  if [ $ERRCOUNT -eq 127 ]
	  then
		  echo "Fatal error, exiting with a failure return code"
		  exit 2
  fi
  echo "Scripts with errors= ${ERRCOUNT}"
  if [ $ERRCOUNT -eq $LASTERRCOUNT ]
	  then
		  echo "No reduction in errors, exiting with a failure return code"
		  exit 1
  else
	  LASTERRCOUNT=$ERRCOUNT
	  counter=$((counter+1))
  fi
done
exit 0
