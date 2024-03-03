package main

import (
	"log"

	"github.com/spf13/viper"
)

func main() {
	var envConfig map[string]interface{}

	getConfig := viper.New()

	getConfig.SetConfigName("auto-tongbudaozhiding1")
	getConfig.SetConfigType("yaml")             // 如果配置文件的名称中没有扩展名，则需要配置此项
	getConfig.AddConfigPath(".")                // 还可以在工作目录中查找配置
	getConfig.AddConfigPath("../updata/config") // 还可以在工作目录中查找配置

	err := getConfig.ReadInConfig() // 查找并读取配置文件
	if err != nil {                 // 处理读取配置文件的错误
		//returnErr("读取配置文件的错误: ", err)
		viper.AutomaticEnv()
		envMap := viper.AllSettings()
		log.Println("1",envMap)
		//envConfig = viper.AllSettings()
	} else {
		envConfig = getConfig.GetStringMap("env") //读取env的配置
		log.Println("2",envConfig)
	}
	
}
