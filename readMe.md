# hookTool
中鱼工具2

# 功能
* 根据配置文件, 自动生成中鱼结果数据

# 输入参数
在config/xlsx/tool.xlsx->HookToolParam 中配置
另:其他excel文件只属于被依赖配置，有id和name配置项即可

# 本地配置
tool_open: true # 开启工具
channel_id: 1001 # 渠道id
hook_tool_config_path: config/data/1/1001/hook_tool_param.json # 导入参数配置

# 使用执行 
windows下点击 startTool.bat

# 输出
当前文件夹下csv文件, 文件名：tool_hook_fish_yyyyMMddHHmmss.csv
