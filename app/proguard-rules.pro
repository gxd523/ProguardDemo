-optimizationpasses 5 #指定压缩级别

-keepattributes Signature #保持泛型

-keepattributes InnerClasses #保留内部类

-keepattributes SourceFile,LineNumberTable #保留代码行号

#-dontshrink #(不要用)不去除无用类，有用类中的无用方法、属性，但是仍会混淆名称
#-dontobfuscate    # 关闭混淆

#-dontusemixedcaseclassnames
-verbose #表示打印混淆的详细信息

-dontoptimize #表示不进行优化，优化可能造成潜在风险

-dontpreverify #表示不进行预校验。作用在Java平台上的，Android不需要，去掉之后还可以加快混淆速度。R8忽略此配置

-dontusemixedcaseclassnames #表示混淆时不使用大小写混合类名

-dontskipnonpubliclibraryclasses #表示不跳过library中的非public的类，R8忽略此配置

-keepattributes *Annotation* #表示对注解中的参数进行保留，前提时注解类没被混淆

-keepclasseswithmembernames class * {#不混淆任何包含native方法的类的类名以及native方法名
    native <methods>;
}

-keepclassmembers enum * {#不混淆枚举中的values()和valueOf()方法
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keepclassmembers class * implements android.os.Parcelable {#不混淆Parcelable实现类中的CREATOR字段
  public static final android.os.Parcelable$Creator CREATOR;
}

-keepclassmembers class **.R$* {#不混淆R文件中的所有静态字段
    public static <fields>;
}

#保持所有实现 Serializable 接口的类成员
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}