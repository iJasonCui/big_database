for SRV_NAME in `cat sybSRV.list`
do
 echo "========================"
echo ${SRV_NAME}
 echo "========================"
  isql -Usa -S${SRV_NAME} -i lock-In-Kap.sql
done

exit 0


