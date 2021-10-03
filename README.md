## 流程
* Shrink(压缩)：删除没有使用的类，字段，方法和属性
* Optimize(优化)：对字节码进行优化，并且移除无用指令，有潜在风险
* Obfuscate(混淆)：使用a,b,c等无意义的名称，对类，字段和方法进行重命名
* Preveirfy(预检)：主要是在Java平台上对处理后的代码进行预检，Android不需要

## 配置
参数 | 含义
--- | :---:
-dontshrink | 关闭压缩
-dontoptimize | 关闭优化
-dontobfuscate | 关闭混淆
-dontpreverify | 关闭预校验
-dontusemixedcaseclassnames | 混淆时不使用大小写混合类名
-verbose | 打印混淆的详细信息

## keep
> 注意：没写{}，则表示不包含任何成员

关键字 | 类压缩 | 类混淆 | {}中的成员压缩 | {}中的成员混淆
--- | :---: | :---: | :---: | :---:
keep | ✕ | ✕ | ✕ | ✕
keepnames | ✓ | ✕ | ✓ | ✕
keepclassmembers | ✓ | ✓ | ✕ | ✕
keepclassmembernames | ✓ | ✓ | ✓ | ✕

### keepclasseswithmembers
* 匹配到`{}`中的内容时，效果同`keep`，否则不产生任何效果

### keepclasseswithmembernames
* 匹配到`{}`中的内容时，效果同`keepnames`，否则不产生任何效果

## keepattributes
> 保留属性

值 | 含义
:---: | :---:
SourceFile,LineNumberTable | 抛出异常时保留代码行号(release时关闭掉)
\*Annotation\* | 保留注解，前提是注解类没被混淆，注解不是SOURCE 
Signature | 泛型
EnclosingMethod | 反射
InnerClasses | 保留内部类(匿名内部类会变内部类)，否则内部类会变成外部类，但还是会混淆 
Exceptions | 保留异常

## 通配符
通配符 | 描述
:---: | :---:
\<fields> | 匹配类中的所有字段
\<methods> | 匹配类中所有的方法
\<init> | 匹配类中所有的构造函数
\* | 匹配包下所有类，不包括子包，只写一个*，表示匹配所有 
\** | 匹配包下所有内容，包括子包，包含包名分隔符(.) 
\*** | 匹配任意参数类型
... | 匹配任意长度的任意类型的参数
extends | 继承
implement | 实现
$ | 内部类

## 反混淆
`/sdk/tools/proguard/bin/retrace.sh mapping.txt proguard_log.txt`

## mapping文件夹
* mappint.text：提供混淆前后类、方法、类成员等的对照表
* seeds.txt：列出没有被混淆的类和成员
* usage.txt：列出被移除的代码

## 默认混淆
* Android默认混淆规则：sdk/tools/proguard/proguard-android.txt

## 其他
* 保留匿名形式：`-keep class com.demo.MainActivity$* { *; }`
