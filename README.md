##res_clear version 1.0
##Environment Requirement
* [Python 2.7](https://www.python.org) (2.7.5 is well tested)
* [PyInstaller](https://pypi.python.org/pypi/PyInstaller) (PyInstaller 2.1 is well tested)
* Necessary PATH environment for python & pyinstaller.
__Attention:To keep compatible with both Windows-32bit & Windows-64bit, please install 32bit python on Windows.__
## 使用说明
`./res_celar 执行脚本会提示对应的步骤`

## 配置相关
`config.json 脚本的基本配置`

```
配置
config.json
{
    "SERCH_PATH": [
        "",
        "src/", 
        "src/app/", 
        "src/app/xlhall/",
        "res/",
        "res/sd/", 
        "res/res_xlhall/"
    ],

    "PROJECT_PATH": [
        {
            "des": "项目根路径", 
            "projectRootPath": "/Users/dongenlai/Desktop/fujian"
        }, 
        {
            "des": "项目cocostudio路径", 
            "cocostudioPath": "/Users/dongenlai/Desktop/fujian/cocosstudio/"
        }, 
        {
            "resPath": "/Users/dongenlai/Desktop/fujian/res/",
            "des": "项目res路径"
        }, 
        {
            "srcPath": "/Users/dongenlai/Desktop/fujian/src/",
            "des": "项目src路径"
        }
    ],

    "COMPRESSINFO": {
        "compress_recordfile": "compres_record.json", 
        "compress_quality": 70
    },

    "TEMP_PATH": [
        {
            "des": "csd导出有用的png备查目录", 
            "importCsdPngDir": "/Users/dongenlai/Documents/xLProject/xlClient.6/csd_pngs/"
        }, 
        {
            "unUsedPngDir": "/Users/dongenlai/Documents/xLProject/xlClient.6/unUsedPng/",
            "des": "无用的png临时存放目录"
        }, 
        {
            "des": "无用的lua文件临时存放目录", 
            "unUsedLuaDir": "/Users/dongenlai/Documents/xLProject/xlClient.6/unUsedLua/"
        }, 
        {
            "unUsedCsbDir": "/Users/dongenlai/Documents/xLProject/xlClient.6/unUsedCsb/",
            "des": "无用的csb文件存放目录"
        }, 
        {
            "des": "无用的csd文件存放目录", 
            "unUsedCsdDir": "/Users/dongenlai/Documents/xLProject/xlClient.6/unUsedCsd/"
        },
        {
            "des": "csb转csd临时目录",
            "csb2csdDir": "/Users/dongenlai/Documents/xLProject/xlClient.6/csb2csd/"
        }
    ],

    "IGNORE_PATHS": [
        "src/cocos/",
        "res/sfx/",
        "res/fonts/",
        "res/gzh/",
        "res/Default/",
        "src/packages/",
        "res/amodule/xlvalueadd/hallprop/propani_/",
        "res/amodule/xlvalueadd/hallprop/uiani_/",
        "res/channel/"
    ],

    "ISDEBUG": true,
    "version": 1.0, 
    "STEMP": {
        "des": "脚本执行的步骤1～8 @title:匿名函数格式化字符串, @step:步骤索引, @btns:选项卡, \n @ExecutionFunction:执行函数作用域为调用对象, @callBack:回调函数", 
        "stemps": [
             {
                "callBack": "lambda func=\"\": func()",
                "step": 1,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\": startLookVuge(param1, param2) ",
                "title": "1>是否开启模糊字符串匹配？",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "不开启",
                        "tag": 1
                    },
                    {
                        "touchEnable": false,
                        "des": "开启(注意！！ 比较耗时，过程请耐心等待)",
                        "tag": 2
                    }
                ]
             },

             {
                "callBack": "lambda func=\"\": func()",
                "step": 2,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\" : startAnalysisCsb(param1, param2) ",
                "title": "lambda path=configure.srcPath, path2=\"\": \"2>分析{0}中所有引用的csb\".format(path)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "查找代码中引用的.csb文件",
                        "tag": 1
                    },
                    {
                        "touchEnable": false,
                        "des": "查找代码中引用的.csb文件并且保存到 record_csb.json 文件中",
                        "tag": 2
                    }
                ]
            },

             {
                "callBack": "lambda func=\"\": func()",
                "step": 3,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\": startCsb2Csd(param1, param2) ",
                "title": "lambda path=configure.resPath, path2=\"\": \"3>分析{0}* 中所有的所有csb | csd\".format(path)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "csb转csd之后分析资源引用路径",
                        "tag": 1
                    },
                    {
                        "touchEnable": false,
                        "des": "从csd中分析资源引用路径",
                        "tag": 2
                    }
                ]
             },

            {
                "callBack": "lambda func=\"\": func()",
                "step": 4,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\" : startAnalysisPng(param1, param2) ",
                "title": "lambda path=configure.srcPath, path2=\"\": \"4>分析{0}* 中所有引用的png\".format(path)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "查找代码中引用的.png&jpg文件",
                        "tag": 1
                    },
                    {
                        "touchEnable": false,
                        "des": "查找代码中引用的.png&jpg文件并且保存到 record_png.json 文件中",
                        "tag": 2
                    }
                ]
            },

            {
                "callBack": "lambda func=\"\": func()",
                "step": 5,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\": startAnalysisCsd(param1, param2) ",
                "title": "lambda path=configure.cocostudioPath, path2=\"\": \"5>分析{0}* 中所有引用的csd\".format(path)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "Yes",
                        "tag": 1
                    },
                    {
                        "touchEnable": false,
                        "des": "No",
                        "tag": 2
                    }
                ]
            },

            {
                "callBack": "lambda func=\"\": func()",
                "step": 6,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\": startRemoveResUnUsedItems(param1, param2) ",
                "title": "lambda path=configure.resPath: \"6>开始移除项目{0}* 中无用的.png | .jpg | .plist\".format(path)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "默认",
                        "tag": false
                    }
                ]
            },
            {
                "callBack": "lambda func=\"\": func()",
                "step": 7,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\" : startMoveCsdUsedItemsToRes(param1, param2) ",
                "title": "lambda path=configure.importCsdPngPath, path2=configure.resPath: \"7>移动{0} 中有用的资源到 {1}目录中\".format(path, path2)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "默认",
                        "tag": false
                    }
                ]
            },
            {
                "callBack": "lambda func=\"\": func()",
                "step": 8,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\": removeNullFolder(param1, param2) ",
                "title": "lambda path=configure.resPath, path2=\"\": \"8>检查{0}*中所有空文件夹\".format(path)",
                "btns": [
                    {
                        "touchEnable": false,
                        "des": "Yes",
                        "tag": 1
                    },
                    {
                        "touchEnable": true,
                        "des": "No",
                        "tag": 2
                    }
                ]
            },
            {
                "callBack": "lambda func=\"\": func()",
                "step": 9,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\" : startCompress(param1, param2) ",
                "title": "lambda path=\"\", path2=\"\": \"9>是否执行压缩操作\".format(path)",
                "btns": [
                    {
                        "touchEnable": false,
                        "des": "Yes",
                        "isNeedAsk": true,
                        "tag": 1
                    },
                    {
                        "touchEnable": true,
                        "des": "No",
                        "tag": 2
                    }
                ]
            },
            {
                "callBack": "lambda func=\"\": func()",
                "step": 10,
                "ExecutionFunction": "lambda param1=\"\", param2=\"\" : startAnalysisLua(param1, param2) ",
                "title": "lambda path=configure.srcPath, path2=\"\": \"10>检查{0}下没有实际使用的lua文件\".format(path)",
                "btns": [
                    {
                        "touchEnable": true,
                        "des": "查找代码中引用的.lua文件",
                        "tag": 1
                    },
                    {
                        "touchEnable": false,
                        "des": "查找代码中引用的.lua文件并且保存到 record_lua.json 文件中",
                        "tag": 2
                    }
                ]
            }
        ]
    },

    "IGNORE_FILES": [
        "src/config.lua",
        "src/xsdk/LoadLuaZip.lua",
        "src/app/md5.lua",
        "src/ccpm/md5.lua",
        "src/xsdk/libs/md5.lua",
        "src/xsdk/libs/protobuf.lua",
        "src/app/cfgclienlog.lua",
        "src/app/libs/base64.lua",
        "src/app/configData/AdConfig.lua",
        "src/app/amodule/xlvalueadd/cfg/VAClientLog.lua",
        "src/app/mvc/BaseScene.lua",
        "src/app/configData/WeChatConfig.lua",
        "src/app/amodule/xlvalueadd/cfg/VAEventType.lua",
        "src/app/configData/Account.lua",
        "src/app/configData/ItemTypeConfig.lua",
        "src/app/PlatformConfig.lua",
        "src/app/ShieldWord.lua",
        "src/app/localizations/ch_cn.lua",
        "src/app/views/friend/DirtyWord.lua",
        "src/app/club/club/event/GuildEvent.lua",
        "src/app/xlhall/inviewcfgconfig.lua",
        "src/app/amodule/xlvalueadd/utils/VACacheMgr.lua",
        "src/app/amodule/xlvalueadd/utils/VALogUtils.lua",
        "src/app/Utils/WebUtil.lua",
        "src/xsdk/TestDemo/TestCNFunc.lua",
        "src/app/amodule/moneyrain/recordpoint.lua",
        "src/app/club/club/regMgr/regdataconfig.lua",
        "src/app/club/club/regMgr/activityhHttpMgr.lua",
        "src/app/xlhall/cfgconfig.lua",
        "src/app/views/Purchase/Recharge_SY6.lua",
        "src/app/amodule/sys/phonebind/phoneBindTools.lua",
        "src/app/amodule/opa/everydayPacket/data/EPLOGEvent.lua",
        "src/app/amodule/opa/PlayGameReward/PlayGameRewardEvents.lua",
        "src/app/amodule/xlshop/cfg/cfgclientlog.lua",
        "src/app/club/club/activities/recall/regdataconfig.lua",
        "src/app/libs/MessagePack.lua",
        "src/app/amodule/EventCenter.lua",
        "src/app/amodule/opa/freeRedBag/FRBLOGEvent.lua",
        "src/app/amodule/opa/wiredactivity/wiredactivityevents.lua",
        "src/app/Sound.lua",
        "src/app/SoundManager.lua",
        "src/xsdk/YuncengInterface.lua"
    ],

    "CSDROOTDATAS_PNG": [
        "FileData", 
        "NormalFileData", 
        "PressedFileData", 
        "DisabledFileData", 
        "NormalBackFileData", 
        "PressedBackFileData", 
        "DisableBackFileData", 
        "NodeNormalFileData", 
        "NodeDisableFileData", 
        "ProgressBarData", 
        "BallNormalData", 
        "BallPressedData", 
        "BallDisabledData", 
        "ImageFileData", 
        "BackGroundData", 
        "TextureFile", 
        "LabelAtlasFileImage_CNB",
        "FontResource"
    ],

    "SERCHCONDITION_SUFFIX": {
        "des": "对应后缀文件存档, 全路径或者隐藏路径",
        ".png": "record_png.json",
        ".plist": "record_plist.json", 
        ".lua": "record_lua.json",
        ".jpg": "record_png.json", 
        ".png&jpg": "record_png.json", 
        ".png&plist": "record_plist&png.json", 
        ".csb": "record_csb.json"
    }
}
```

## 配置说明
1.`SERCH_PATH:`   各个项目自己的搜索路径

2.`PROJECT_PATH:` 项目路径配置细看res描述字段

3.`COMPRESSINFO:` 压缩相关选项{compress_recordfile:压缩保存记录到文件, compress_quality:压缩比例(0 ～ 100)}

4.`TEMP_PATH:`    临时路径配置细看res描述字段

5.`IGNORE_PATHS:` 忽略查找到文件夹

6.`ISDEBUG:` 如果true只塞选不做真是删减操作

7.`version:` 版本号

8.`STEMP:` GUI启动和命令行启动执行到步骤可自定义选择执行某步

9.`IGNORE_FILES:` 忽略查找文件

9.`CSDROOTDATAS_PNG:` cocostudio中的资源查找节点

9.`SERCHCONDITION_SUFFIX:` 对应后缀查找文件使用记录，比如无用的和项目中实际使用到的png会记录到record_png.json中


# Commands Required
Please see this [issue](https://blog.csdn.net/Code_Nice/article/details/83864757)
